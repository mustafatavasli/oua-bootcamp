import 'package:flutter/material.dart';

class YakinlarimEkleScreen extends StatelessWidget {
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _soyadController = TextEditingController();
  final TextEditingController _telefonController = TextEditingController();
  final TextEditingController _yakinlikController = TextEditingController();

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
      body: Padding(
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
            SizedBox(height: 10),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _adController,
                  decoration: InputDecoration(
                    labelText: 'Yakının Adı',
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
            SizedBox(height: 50),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _soyadController,
                  decoration: InputDecoration(
                    labelText: 'Yakının Soyadı',
                    suffixIcon: Icon(Icons.person),
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
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
            SizedBox(height: 50),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _telefonController,
                  decoration: InputDecoration(
                    labelText: 'Telefon Numarası',
                    suffixIcon: Icon(Icons.phone),
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
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
            SizedBox(height: 50),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _yakinlikController,
                  decoration: InputDecoration(
                    labelText: 'Yakınlık Derecesi',
                    suffixIcon: Icon(Icons.family_restroom),
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
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
            SizedBox(height: 40),
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
                      onPressed: () {
                        if (_adController.text.isNotEmpty &&
                            _soyadController.text.isNotEmpty &&
                            _telefonController.text.isNotEmpty &&
                            _yakinlikController.text.isNotEmpty) {
                          Map<String, String> yakinData = {
                            'ad': _adController.text,
                            'soyad': _soyadController.text,
                            'telefon': _telefonController.text,
                            'yakinlik': _yakinlikController.text,
                          };
                          Navigator.pop(context, yakinData);
                        }
                      },
                      child: Text(
                        'Yakın Ekle',
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
    );
  }
}
