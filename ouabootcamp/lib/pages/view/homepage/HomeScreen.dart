import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ouabootcamp/pages/view/IntroScreen.dart';
import 'package:ouabootcamp/pages/view/ProfileScreen.dart';
import 'package:ouabootcamp/pages/view/homepage/cardsdesignmid.dart';
import 'package:ouabootcamp/pages/view/homepage/servicedesignpart.dart';
import '../MedList.dart';
import 'cardsdesigntop.dart';


class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/Logo.png',height: 40,),
            Text('Sağlık Pusulası',style: TextStyle(fontFamily: 'Cinzel',fontSize: 20,letterSpacing: 5),),
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
                child:const CardExampleTop() ,
              ),
              SizedBox(height: 20),
              Text('Servisler', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ServicesDesign(),
              SizedBox(height: 20),
              CardExampleMid(),
              SizedBox(height: 20),
              Text('Yaklaşan Hatırlatıcılar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }
}




