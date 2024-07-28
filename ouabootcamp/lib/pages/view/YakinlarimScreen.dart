import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ouabootcamp/pages/view/YakinlarimEkleScreen.dart';

class YakinlarimScreen extends StatefulWidget {
  @override
  _YakinlarimScreenState createState() => _YakinlarimScreenState();
}

class _YakinlarimScreenState extends State<YakinlarimScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> yakinlarStream;

  @override
  void initState() {
    super.initState();
    yakinlarStream = _firestore.collection('yakinlar').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
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
                  await _firestore.collection('yakinlar').add(yeniYakin);
                }
              },
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: yakinlarStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return Center(child: Text('Henüz yakın eklenmemiş.'));
          }
          final yakinlarDocs = snapshot.data!.docs;
          return SingleChildScrollView(
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
                        children: yakinlarDocs
                            .map((doc) => _buildSquare(context, doc))
                            .toList(),
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
          );
        },
      ),
    );
  }

  Widget _buildSquare(BuildContext context, DocumentSnapshot doc) {
    final yakinData = doc.data() as Map<String, dynamic>;
    final name = yakinData['ad'] as String;

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
              color: Color.fromARGB(255, 255, 189, 189),
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
            onPressed: () async {
              await _firestore.collection('yakinlar').doc(doc.id).delete();
            },
          ),
        ),
      ],
    );
  }
}
