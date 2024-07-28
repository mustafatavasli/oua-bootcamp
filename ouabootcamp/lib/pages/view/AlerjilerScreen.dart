import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ouabootcamp/pages/view/AlerjilerEkleScreen.dart';

class AlerjilerScreen extends StatefulWidget {
  @override
  _AlerjilerScreenState createState() => _AlerjilerScreenState();
}

class _AlerjilerScreenState extends State<AlerjilerScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
                final yeniAlerji = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlerjilerEkleScreen()),
                );
                if (yeniAlerji != null && yeniAlerji is Map<String, String>) {
                  setState(() {
                    _firestore.collection('alerjiler').add(yeniAlerji);
                  });
                }
              },
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _firestore.collection('alerjiler').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Bir hata oluştu: ${snapshot.error}'));
          }

          final alerjiler = snapshot.data!.docs;

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
                        'Alerjiler',
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
                            'assets/images/Alerjiler.png',
                            width: 38,
                            height: 36,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alerji kayıtlarınızı buradan görebilir, \nönceden tedbir alabilirsiniz.',
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
                        children: alerjiler
                            .map((alerji) => _buildSquare(context, alerji))
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

  Widget _buildSquare(BuildContext context, QueryDocumentSnapshot alerji) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AlerjilerEkleScreen()),
            );
          },
          child: Container(
            margin: EdgeInsets.only(left: 5, bottom: 20),
            width: 144,
            height: 120,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 246, 197, 247),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 25,
                  child: Image.asset(
                    'assets/images/alerji.png',
                    width: 56,
                    height: 56,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Text(
                    alerji['ad'],
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
                _firestore.collection('alerjiler').doc(alerji.id).delete();
              });
            },
          ),
        ),
      ],
    );
  }
}
