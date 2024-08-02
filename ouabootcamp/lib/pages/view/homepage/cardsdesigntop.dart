import 'package:flutter/material.dart';

class CardExampleTop extends StatelessWidget {
  const CardExampleTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
        color: Color.fromRGBO(254, 226, 249, 1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text('Merhaba,', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5)),
              subtitle: Text('Hoşgeldin Kullanıcı'),
              trailing: Image(image: AssetImage('assets/images/Group.png')),
            ),
          ],
        ),
      ),
    );
  }
}
