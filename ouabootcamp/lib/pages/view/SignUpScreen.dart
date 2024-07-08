import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Add your logo or illustration here
              Image.asset('assets/images/signup.png'),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Ad',
                  suffixIcon: Icon(Icons.person),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Soyad',
                  suffixIcon: Icon(Icons.person),
                ),
              ),
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
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(53, 58, 72, 1),
                    minimumSize: Size(400, 50)
                ),
                onPressed: () {},
                child: Text('Giriş Yap',style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.g_translate),
                label: Text('Google ile Kayıt Ol'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white,
                  minimumSize: Size(400,50)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

