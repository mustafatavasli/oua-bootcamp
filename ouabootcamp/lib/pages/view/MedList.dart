import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'MedAdd.dart';
import 'homepage/cardsdesignbottom.dart';

class MedList extends StatefulWidget {
  @override
  _MedListState createState() => _MedListState();
}

class _MedListState extends State<MedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.add),
              iconSize: 30,
              onPressed: () async {
                final newMedication = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MedAdd()),
                );
                if (newMedication != null && newMedication is Map<String, String>) {
                  // MedAdd already adds to Firestore, so no need to add here
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
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: Offset(20, 0),
                    child: Text(
                      'İlaç Hatırlatıcı',
                      style: TextStyle(
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Transform.translate(
                    offset: Offset(20, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/ilac.png',
                          width: 38,
                          height: 36,
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Daha sağlıklı günler için doğru zaman,\ndoğru ilaç.',
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
                  ),
                  SizedBox(height: 25),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('medications').snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final medications = snapshot.data!.docs;
                      return Column(
                        children: medications.map((doc) {
                          final medication = doc.data() as Map<String, dynamic>;
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Stack(
                                      children: [
                                        CardExampleBottom(
                                          date: medication['date']!,
                                          time: medication['time']!,
                                          name: medication['name']!,
                                          reason: medication['reason']!,
                                          key: Key(doc.id), // Ensure each card has a unique key
                                          onDelete: () async {
                                            await FirebaseFirestore.instance
                                                .collection('medications')
                                                .doc(doc.id)
                                                .delete();
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                            ],
                          );
                        }).toList(),
                      );
                    },
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
}
