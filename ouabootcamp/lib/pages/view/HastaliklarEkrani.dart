import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ouabootcamp/pages/view/HastalikEkle.dart';

class HastaliklarEkrani extends StatefulWidget {
  @override
  _HastaliklarEkraniState createState() => _HastaliklarEkraniState();
}

class _HastaliklarEkraniState extends State<HastaliklarEkrani> {
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
                final yeniHastalik = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HastalikEkle()),
                );
                if (yeniHastalik != null && yeniHastalik is Map<String, String>) {
                  _firestore.collection('hastaliklar').add(yeniHastalik);
                }
              },
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: _firestore.collection('hastaliklar').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final hastaliklar = snapshot.data!.docs;

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
                        'Hastalıklar',
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
                            'assets/images/hastaliklar.png',
                            width: 38,
                            height: 36,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hastalıklarınızı buradan görebilir,\nönceden tedbir alabilirsiniz.',
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
                        children: hastaliklar.map((doc) {
                          final data = doc.data() as Map<String, dynamic>;
                          final name = data['ad'] as String;

                          return _buildSquare(context, doc.id, name);
                        }).toList(),
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

  Widget _buildSquare(BuildContext context, String docId, String name) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HastalikEkle()),
            );
          },
          child: Container(
            margin: EdgeInsets.only(left: 5, bottom: 20),
            width: 144,
            height: 120,
            decoration: BoxDecoration(
              color: Color.fromARGB(55, 6, 206, 255),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 25,
                  child: Image.asset(
                    'assets/images/hastaliklarcard.png',
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
              _firestore.collection('hastaliklar').doc(docId).delete();
            },
          ),
        ),
      ],
    );
  }
}
