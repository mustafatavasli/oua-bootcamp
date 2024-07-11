import 'package:flutter/material.dart';

class AlerjilerEkleScreen extends StatelessWidget {
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _dereceController = TextEditingController();
  final TextEditingController _aciklamaController = TextEditingController();

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
            SizedBox(height: 30),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _adController,
                  decoration: InputDecoration(
                    labelText: 'Alerji Adı',
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
                  controller: _dereceController,
                  decoration: InputDecoration(
                    labelText: 'Alerji Derecesi',
                    suffixIcon: Icon(Icons.person),
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
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
                  controller: _aciklamaController,
                  decoration: InputDecoration(
                    labelText: 'Alerji Açıklaması',
                    suffixIcon: Icon(Icons.mail),
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
            SizedBox(height: 80),
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
                            _dereceController.text.isNotEmpty &&
                            _aciklamaController.text.isNotEmpty) {
                          Map<String, String> alerjiData = {
                            'ad': _adController.text,
                            'derece': _dereceController.text,
                            'aciklama': _aciklamaController.text,
                          };
                          Navigator.pop(context, alerjiData);
                        }
                      },
                      child: Text(
                        'Alerji Ekle',
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
