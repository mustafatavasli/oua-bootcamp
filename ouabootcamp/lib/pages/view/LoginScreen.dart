import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/loginimage.png'), // Replace with your image asset
              SizedBox(height: 20),
              Text(
                'Hoşgeldiniz!',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,fontFamily: 'Montserrat',letterSpacing: 2),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email Adresi',
                  suffixIcon: Icon(Icons.email),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  suffixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(53, 58, 72, 1),
                  minimumSize: Size(400, 50)
                ),
                onPressed: () {},
                child: Text('Giriş Yap',style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
