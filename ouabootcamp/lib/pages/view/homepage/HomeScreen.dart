import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cardsdesigntop.dart';
import 'cardsdesignmid.dart';
import 'servicedesignpart.dart';
import '../MedList.dart';
import 'cardsdesignbottom.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('assets/images/Logo.png', height: 40),
            Text(
              'Sağlık Pusulası',
              style: TextStyle(
                fontFamily: 'Cinzel',
                fontSize: 20,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: const CardExampleTop(),
              ),
              SizedBox(height: 20),
              Text(
                'Servisler',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ServicesDesign(),
              SizedBox(height: 20),
              CardExampleMid(),
              SizedBox(height: 20),
              Text(
                'Yaklaşan Hatırlatıcı',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('medications').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final medications = snapshot.data!.docs;
                  if (medications.isEmpty) {
                    return Center(child: Text('Yaklaşan bir hatırlatıcı yok.'));
                  }

                  // En yakın tarihli hatırlatıcıyı bul
                  var nearestMedication = medications[0];
                  var nearestDate = parseTurkishDate(nearestMedication['date']);
                  for (var doc in medications) {
                    var medicationDate = parseTurkishDate(doc['date']);
                    if (medicationDate.isBefore(nearestDate)) {
                      nearestMedication = doc;
                      nearestDate = medicationDate;
                    }
                  }

                  final medication = nearestMedication.data() as Map<String, dynamic>;
                  return CardExampleBottom(
                    date: medication['date']!,
                    time: medication['time']!,
                    name: medication['name']!,
                    reason: medication['reason']!,
                    onDelete: () async {
                      await FirebaseFirestore.instance
                          .collection('medications')
                          .doc(nearestMedication.id)
                          .delete();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

DateTime parseTurkishDate(String date) {
  // Turkish month names
  final months = {
    'Oca': 1,
    'Şub': 2,
    'Mar': 3,
    'Nis': 4,
    'May': 5,
    'Haz': 6,
    'Tem': 7,
    'Ağu': 8,
    'Eyl': 9,
    'Eki': 10,
    'Kas': 11,
    'Ara': 12,
  };

  // Split date string
  final parts = date.split(' ');
  if (parts.length != 3) {
    throw FormatException('Invalid date format');
  }

  // Extract day, month, and year
  final day = int.parse(parts[0]);
  final month = months[parts[1]];
  final year = DateTime.now().year; // Assuming the year is the current year

  if (month == null) {
    throw FormatException('Invalid month format');
  }

  return DateTime(year, month, day);
}
