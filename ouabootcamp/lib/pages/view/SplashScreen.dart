import 'package:flutter/material.dart';
import 'IntroScreen.dart';




class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    firebaseInitialize();
  }

  Future<void> firebaseInitialize() async {
    await Future.delayed(Duration(seconds: 4)); // Delay for splash screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => IntroScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Logo.png', // Ensure the image is added in your assets folder
              width: 200,
              height: 200,
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "Sağlık Pusulası",
                style: TextStyle(fontSize: 35,color: Colors.black,fontFamily: 'Cinzel'),
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}