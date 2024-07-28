import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  final _auth = AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  // Kayıt işlemi
  Future SignUp() async {
    try {
      // Kullanıcı oluştur
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Kullanıcı bilgilerini Firestore'a ekle
      await addUserDetails(_nameController.text.trim(), _surnameController.text.trim(), _emailController.text.trim(), userCredential.user!.uid);

      // Başarılı mesajı göster
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kayıt Başarıyla Oluşturuldu.')),
      );

      // Login ekranına yönlendir
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } catch (e) {
      // Hata mesajı göster
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Kayıt başarısız. ${e.toString()}')),
      );
    }
  }

  Future addUserDetails(String firstName, String lastName, String email, String uid) async {
    await FirebaseFirestore.instance.collection('users').doc(uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Transform.translate(
              offset: Offset(0, -40), // Tüm sütunu yukarı kaydırır
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/signup.png',
                    width: 300, // Genişlik ayarı
                    height: 300, // Yükseklik ayarı
                  ),
                  SizedBox(height: 1), // Görselin altına boşluk ekler
                  SizedBox(
                    width: 320, // TextField'ların genişlik ayarı
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Ad',
                        suffixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  SizedBox(
                    width: 320, // TextField'ların genişlik ayarı
                    child: TextField(
                      controller: _surnameController,
                      decoration: InputDecoration(
                        labelText: 'Soyad',
                        suffixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  SizedBox(
                    width: 320, // TextField'ların genişlik ayarı
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Adresi',
                        suffixIcon: Icon(Icons.email),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  SizedBox(
                    width: 320, // TextField'ların genişlik ayarı
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Şifre',
                        suffixIcon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 320, // Butonun boyut ayarı
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(53, 58, 72, 1),
                        minimumSize: Size(300, 50),
                      ),
                      onPressed: SignUp,
                      child: Text(
                        'Kayıt Ol',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 320, // Butonun boyut ayarı
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        UserCredential? userCredential = await _auth.loginWithGoogle();
                        if (userCredential != null) {
                          // Kullanıcı bilgilerini Firestore'a ekle
                          await addUserDetails(_nameController.text.trim(), _surnameController.text.trim(), _emailController.text.trim(), userCredential.user!.uid);

                          // Başarılı mesajı göster
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Google ile Kayıt Başarıyla Oluşturuldu.')),
                          );

                          // Login ekranına yönlendir
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        } else {
                          // Hata mesajı göster
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Google ile Kayıt başarısız.')),
                          );
                        }
                      },
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

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential?> loginWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        // Kullanıcı girişini iptal etti
        return null;
      }

      final googleAuth = await googleUser.authentication;

      final cred = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      return await _auth.signInWithCredential(cred);
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
