import 'package:flutter/material.dart';
import 'package:ouabootcamp/pages/view/YakinlarimEkleScreen.dart';

class YakinlarimScreen extends StatefulWidget {
  @override
  _YakinlarimScreenState createState() => _YakinlarimScreenState();
}

class _YakinlarimScreenState extends State<YakinlarimScreen> {
  List<Map<String, String>> yakinlar = []; // Start with an empty list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''), // Remove the text from the AppBar
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(Icons.add),
              iconSize: 30,
              onPressed: () async {
                final yeniYakin = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => YakinlarimEkleScreen()),
                );
                if (yeniYakin != null && yeniYakin is Map<String, String>) {
                  setState(() {
                    yakinlar.add(yeniYakin);
                  });
                }
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yakınlarım',
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/yakinlarim.png',
                        width: 38,
                        height: 36,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Acil anlarda hızlı bağlantı. Sevdikleriniz \nhep yanınızda!',
                            style: TextStyle(
                              fontFamily: 'DM Sans',
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Wrap(
                    spacing: 15,
                    runSpacing: 10,
                    children: yakinlar.map((yakin) => _buildSquare(context, yakin['ad']!)).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(''),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSquare(BuildContext context, String name) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => YakinlarimEkleScreen()),
            );
          },
          child: Container(
            margin: EdgeInsets.only(left: 5, bottom: 20),
            width: 144,
            height: 120,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 243, 198, 213),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 25,
                  child: Image.asset(
                    'assets/images/kisikonu.png',
                    width: 56,
                    height: 56,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'DM Sans',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: Icon(Icons.close, color: const Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {
              setState(() {
                yakinlar.removeWhere((yakin) => yakin['ad'] == name);
              });
            },
          ),
        ),
      ],
    );
  }
}
