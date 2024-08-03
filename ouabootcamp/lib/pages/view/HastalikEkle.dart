import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HastalikEkle extends StatelessWidget {
  final TextEditingController _adController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Transform.translate(
                  offset: Offset(0, -20),
                  child: Image.asset('assets/images/Logo.png', height: 124, alignment: Alignment.topCenter),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: _adController,
                    decoration: InputDecoration(
                      labelText: 'Hastalık Adı',
                      suffixIcon: Icon(Icons.person),
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Transform.translate(
                    offset: Offset(-15, 0),
                    child: SizedBox(
                      width: 120,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF353A48),
                        ),
                        onPressed: () async {
                          if (_adController.text.isNotEmpty) {
                            Map<String, String> hastalikData = {
                              'ad': _adController.text,
                            };
                            Navigator.pop(context, hastalikData);
                          }
                        },
                        child: Text(
                          'Hastalık Ekle',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
