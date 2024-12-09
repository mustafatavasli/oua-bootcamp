import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ouabootcamp/pages/view/BottomNavBar.dart';
import 'package:ouabootcamp/pages/view/homepage/HomeScreen.dart';
import 'package:ouabootcamp/pages/view/LoginScreen.dart';
import 'package:ouabootcamp/pages/view/SignUpScreen.dart';

import 'GeminiScreen.dart';


class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/ıntroscreen.png'), // Replace with your image asset
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(right: 90),
              child: Text(
                'Sağlık Pusulası',
                style: TextStyle(fontSize: 22,fontFamily: 'Cinzel'),

              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(right: 40),
              margin: EdgeInsets.only(left: 32),
              child: Text(
                'Anında bilgi, hızlı müdahale, sağlıklı yaşam.',
                style: TextStyle(fontSize: 16,fontFamily: 'Montserrat',fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,

              ),
            ),
            SizedBox(height: 70),

            Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(53, 58, 72, 1),
                      minimumSize: Size(0, 50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text('Giriş Yap',style: TextStyle(color: Colors.white),),

                ),),
                Expanded(child: SizedBox()),
                Expanded(
                  flex: 7,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
                      minimumSize: Size(0, 50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text('Kayıt Ol',style: TextStyle(color: Colors.black),),
                  ),),
              ],
            ),
            SizedBox(height: 10),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GuestCardScreen()),
                );
              },
              child: Text('Misafir Girişi',style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}
