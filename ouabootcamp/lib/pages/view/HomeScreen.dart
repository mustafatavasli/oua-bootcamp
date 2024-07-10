import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ouabootcamp/pages/view/YakinlarimScreen.dart';
import 'package:ouabootcamp/pages/view/AlerjilerScreen.dart'; // Import AlerjilerScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sağlık Pusulası'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Merhaba, Mustafa TAVASLI',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Servisler', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ServiceIcon(
                  icon: Icons.info,
                  label: 'Bilgiler',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AlerjilerScreen()),
                    );
                  },
                ),
                ServiceIcon(icon: Icons.history, label: 'Geçmiş'),
                ServiceIcon(
                  icon: Icons.people,
                  label: 'Aile',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => YakinlarimScreen()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Yaklaşan Hatırlatıcılar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ReminderItem(title: 'Parol', subtitle: 'Ağrı Kesici'),
            ReminderItem(title: 'Kaptoril', subtitle: 'Tansiyon İlacı'),
          ],
        ),
      ),
    );
  }
}

class ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap; // onTap işlevini ekleyin

  ServiceIcon({required this.icon, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // GestureDetector ile onTap'i tanımlayın
      child: Column(
        children: <Widget>[
          Icon(icon, size: 40),
          SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}

class ReminderItem extends StatelessWidget {
  final String title;
  final String subtitle;

  ReminderItem({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
