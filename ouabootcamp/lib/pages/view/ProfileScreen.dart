import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius:80,
              backgroundColor: Color.fromRGBO(251, 236, 241,1),
              backgroundImage:AssetImage("assets/images/Logo.png")
            ),
            SizedBox(height: 50),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
              color: Color.fromRGBO(251, 236, 241,1),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text('Ad',style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 0.5,),),
                      subtitle: Text('Muhammed Yiğit Özgül'),
                      trailing: Icon(Icons.person),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      title: Text('Userme',style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 0.5,)),
                      subtitle: Text('@yigit14'),
                      trailing: Icon(Icons.supervised_user_circle_outlined),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      title: Text('Email',style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 0.5,)),
                      subtitle: Text('akademi@hotmail.com'),
                      trailing: Icon(Icons.mail),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}