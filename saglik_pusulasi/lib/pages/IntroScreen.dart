import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 375,
            height: 812,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 375,
                    height: 812,
                    decoration: BoxDecoration(color: Colors.white),
                  ),
                ),
                Positioned(
                  left: 157,
                  top: 723,
                  child: Text(
                    'Misafir Girişi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF343A48),
                      fontSize: 10,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 0.20,
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 650,
                  child: Container(
                    width: 295,
                    height: 48,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 295,
                            height: 48,
                            decoration: ShapeDecoration(
                              color:
                                  Colors.black.withOpacity(0.05000000074505806),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                  color: Color(0xFF343A48),
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 194,
                          top: 16,
                          child: Text(
                            'Kayıt Ol',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF343A48),
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 40,
                  top: 650,
                  child: Container(
                    width: 147,
                    height: 48,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 147,
                            height: 48,
                            decoration: ShapeDecoration(
                              color: Color(0xFF343A48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 43,
                          top: 16,
                          child: Text(
                            'Giriş Yap',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w600,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 46,
                  top: 536,
                  child: SizedBox(
                    width: 238,
                    child: Text(
                      'Anında bilgi, hızlı müdahale, sağlıklı yaşam.',
                      style: TextStyle(
                        color: Color(0xFF343A48),
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 0.10,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 46,
                  top: 492,
                  child: Text(
                    'Sağlık Pusulası',
                    style: TextStyle(
                      color: Color(0xFF343A48),
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: -0.30,
                    ),
                  ),
                ),
                Positioned(
                  left: 17,
                  top: 101,
                  child: Container(
                    width: 343,
                    height: 343,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/343x343"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
