import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'LoginScreen.dart';



class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  //auth

  Future SignUp() async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      addUserDetails(_nameController.text.trim(),_surnameController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kayıt Başarıyla Oluşturuldu.')),
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kayıt başarısız.')),
      );
    }
  }

  //userinfo
  Future addUserDetails(String firstName,String LastName) async{
    await FirebaseFirestore.instance.collection('userData').add(
      {
        'firstName': firstName,
        'LastName': LastName,
      }
    );
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
              // Add your logo or illustration here
              Image.asset('assets/images/signup.png'),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Ad',
                  suffixIcon: Icon(Icons.person),
                ),

              ),
              TextField(
                controller: _surnameController,
                decoration: InputDecoration(
                  labelText: 'Soyad',
                  suffixIcon: Icon(Icons.person),
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email Adresi',
                  suffixIcon: Icon(Icons.email),
                ),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  suffixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(53, 58, 72, 1),
                    minimumSize: Size(400, 50)
                ),
                onPressed: () {
                  SignUp();
                },
                child: Text('Kayıt Ol',style: TextStyle(color: Colors.white),),
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


