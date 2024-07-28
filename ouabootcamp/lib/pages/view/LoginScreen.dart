import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ouabootcamp/pages/view/BottomNavBar.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future SignIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationExample(),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Giriş başarısız. ${e.toString()}')),
      );
    }
  }

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
              Transform.translate(
                offset: Offset(-30, 0), // Move 30 units to the left
                child: Image.asset(
                  'assets/images/loginimage.png',
                  width: 300, // Desired width
                  height: 300, // Desired height
                ),
              ),
              SizedBox(height: 20),
              Transform.translate(
                offset: Offset(-30, 0), // Move 30 units to the left
                child: Text(
                  'Hoşgeldiniz!',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 320, // Set a maximum width for the TextFields
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Adresi',
                    suffixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0), // Adjust padding
                  ),
                ),
              ),
              SizedBox(height: 1),
              SizedBox(
                width: 320, // Set a maximum width for the TextFields
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    suffixIcon: Icon(Icons.lock),
                    contentPadding: EdgeInsets.symmetric(vertical: 12.0), // Adjust padding
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(53, 58, 72, 1),
                    minimumSize: Size(320, 50), // Adjust the size of the button
                  ),
                  onPressed: SignIn,
                  child: Text(
                    'Giriş Yap',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
