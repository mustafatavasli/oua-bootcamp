import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CardExampleTop extends StatelessWidget {
  const CardExampleTop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
        color: Color.fromRGBO(251, 236, 241,1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text('Merhaba,',style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 0.5),),
              subtitle: Text('Mustafa TAVASLI'),
              trailing: Image(image:AssetImage('assets/images/Group.png')),
            ),
          ],
        ),
      ),
    );
  }
}