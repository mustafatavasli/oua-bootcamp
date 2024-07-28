import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CardExampleTop extends StatelessWidget {
  const CardExampleTop({super.key});

  Future<Map<String, dynamic>?> getUserInfo() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      return userDoc.data() as Map<String, dynamic>?;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>?>(
      future: getUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Bir hata oluştu'));
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text('Kullanıcı bilgisi bulunamadı'));
        } else {
          final userInfo = snapshot.data!;
          final fullName = '${userInfo['firstName']} ${userInfo['lastName']}';

          return Center(
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
              color: Color.fromRGBO(254, 226, 249, 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('Merhaba,', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                    subtitle: Text(fullName),
                    trailing: Image(image: AssetImage('assets/images/Group.png')),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

