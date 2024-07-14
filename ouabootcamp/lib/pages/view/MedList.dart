import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MedAdd.dart'; // Ensure this import is correct
import 'homepage/cardsdesignbottom.dart'; // Ensure this import is correct
import 'package:intl/intl.dart';

class MedList extends StatefulWidget {
  @override
  _MedListState createState() => _MedListState();


}

class _MedListState extends State<MedList> {
  List<Map<String, String>> medications = []; // Start with an empty list

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
                  setState(() {
                    medications.add(newMedication);
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
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'İlaç Hatırlatıcı',
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
                        'assets/images/ilac.png',
                        width: 38,
                        height: 36,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Daha sağlıklı günler için doğru zaman,\ndoğru ilaç',
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
                  SizedBox(height: 25),
                  Column(
                    children: medications.map((medication) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: CardExampleBottom(
                                  date: medication['date']!,
                                  time: medication['time']!,
                                  name: medication['name']!,
                                  reason: medication['reason']!,
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      medications.remove(medication);
                                    });
                                  },
                                  icon: Icon(Icons.close),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      );
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
      ),
    );
  }
}
