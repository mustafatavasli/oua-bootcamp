import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CardExampleMid extends StatelessWidget {
  const CardExampleMid({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
        color: Color.fromRGBO(251, 236, 241,1),
        child:Row(
          children: [
            const Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sağlık Bilgilerine Hızlı Erişim Sistemi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Color.fromRGBO(135, 182, 172,1)
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Sağlığınız her zaman bizim önceliğimizdir',
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Image.asset(
                  'assets/images/hemsire.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}