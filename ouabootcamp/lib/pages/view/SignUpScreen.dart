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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Transform.translate(
              offset: Offset(0, -40), // Move the entire column up by 10 units
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/signup.png',
                    width: 300, // Adjust the width as needed
                    height: 300, // Adjust the height as needed
                  ),
                  SizedBox(height: 1), // Add some spacing below the image
                  SizedBox(
                    width: 320, // Set a maximum width for the TextFields
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Ad',
                        suffixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  SizedBox(
                    width: 320, // Set a maximum width for the TextFields
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Soyad',
                        suffixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  SizedBox(
                    width: 320, // Set a maximum width for the TextFields
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Email Adresi',
                        suffixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  SizedBox(
                    width: 320, // Set a maximum width for the TextFields
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Şifre',
                        suffixIcon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 320, // Adjust the size of the button
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(53, 58, 72, 1),
                        minimumSize: Size(300, 50),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Giriş Yap',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 320, // Adjust the size of the button
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.g_translate),
                      label: Text('Google ile Kayıt Ol'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        minimumSize: Size(300, 50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
