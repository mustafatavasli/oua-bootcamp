import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpScreenCompleted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                left: 40,
                top: 683,
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
                            color: Color(0xFFF2F2F2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 67,
                        top: 15,
                        child: Container(
                          width: 160,
                          height: 18,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 33,
                                top: 0,
                                child: Text(
                                  'Google ile Kayıt Ol',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF353A48),
                                    fontSize: 14,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                    letterSpacing: -0.30,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 1,
                                child: Container(
                                  width: 17,
                                  height: 17,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 615,
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
                            color: Color(0xFF343A48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 121,
                        top: 16,
                        child: Text(
                          'Kayıt Ol',
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
                left: 40,
                top: 543,
                child: Container(
                  width: 295,
                  height: 52,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(width: 295, height: 52),
                      ),
                      Positioned(
                        left: 0,
                        top: 16,
                        child: SizedBox(
                          width: 238,
                          child: Text(
                            'Şifre',
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
                        left: 256,
                        top: 14,
                        child: Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 3, vertical: 2),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 491,
                child: Container(
                  width: 295,
                  height: 52,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(width: 295, height: 52),
                      ),
                      Positioned(
                        left: 0,
                        top: 16,
                        child: SizedBox(
                          width: 238,
                          child: Text(
                            'Email Adresi',
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
                        left: 256,
                        top: 14,
                        child: Container(
                          width: 24,
                          height: 24,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: FlutterLogo(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 439,
                child: Container(
                  width: 295,
                  height: 52,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(width: 295, height: 52),
                      ),
                      Positioned(
                        left: 0,
                        top: 16,
                        child: SizedBox(
                          width: 238,
                          child: Text(
                            'Soyad',
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
                        left: 256,
                        top: 12,
                        child: Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(4),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  child: Stack(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 385,
                child: Container(
                  width: 295,
                  height: 52,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(width: 295, height: 52),
                      ),
                      Positioned(
                        left: 0,
                        top: 16,
                        child: SizedBox(
                          width: 238,
                          child: Text(
                            'Ad',
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
                        left: 256,
                        top: 12,
                        child: Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(4),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  height: double.infinity,
                                  child: Stack(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 46,
                top: 83,
                child: Container(
                  width: 281.93,
                  height: 281.93,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("https://via.placeholder.com/282x282"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
