import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreenCompleted extends StatelessWidget {
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
                left: 100,
                top: 711,
                child: Container(
                  width: 174,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 150,
                        top: 16,
                        child: Opacity(
                          opacity: 0.50,
                          child: Container(
                            width: 24,
                            height: 24,
                            padding: const EdgeInsets.only(
                              top: 2.50,
                              left: 4,
                              right: 4.85,
                              bottom: 2.28,
                            ),
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
                      ),
                      Positioned(
                        left: 59,
                        top: 0,
                        child: Container(
                          width: 56,
                          height: 56,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 56,
                                  height: 56,
                                  decoration: ShapeDecoration(
                                    color: Color(0xFF051328),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 18,
                                top: 23,
                                child: Container(
                                  width: 19,
                                  height: 7,
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
                        left: 0,
                        top: 16,
                        child: Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2.23, vertical: 2.25),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Row(
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
                left: 35,
                top: 585,
                child: Container(
                  width: 275,
                  height: 80,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Opacity(
                          opacity: 0.10,
                          child: Container(
                            width: 275,
                            height: 80,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD2416E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 100,
                        top: 15,
                        child: Container(
                          height: 51,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 63,
                                child: Text(
                                  'Kaptoril',
                                  style: TextStyle(
                                    color: Color(0xFF1C9578),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 63,
                                child: Text(
                                  'Tansiyon İlacı',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13,
                        top: 15,
                        child: Opacity(
                          opacity: 0.10,
                          child: Container(
                            width: 59,
                            height: 51,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD2416E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13,
                        top: 25,
                        child: SizedBox(
                          width: 55,
                          height: 38,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '12 Pzt\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '13.00',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w100,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 458,
                child: Container(
                  width: 275,
                  height: 80,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Opacity(
                          opacity: 0.10,
                          child: Container(
                            width: 275,
                            height: 80,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD2416E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 100,
                        top: 15,
                        child: Container(
                          height: 51,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 49,
                                child: Text(
                                  'Parol',
                                  style: TextStyle(
                                    color: Color(0xFF1C9578),
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 49,
                                child: Text(
                                  'Ağrı Kesici',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w300,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 24,
                        child: SizedBox(
                          width: 55,
                          height: 38,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '12 Pzt\n',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: '11.00',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w100,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 402,
                child: Text(
                  'Yaklaşan Hatırlatıcılar',
                  style: TextStyle(
                    color: Color(0xFF051328),
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 241,
                child: Container(
                  width: 305,
                  height: 150,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 185,
                        top: 0,
                        child: Container(
                          width: 120,
                          height: 150,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://via.placeholder.com/120x150"),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(39),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 24,
                        top: 41,
                        child: Container(
                          width: 152,
                          height: 58,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: SizedBox(
                                  width: 152,
                                  height: 44,
                                  child: Text(
                                    'Sağlık Bilgilerine Hızlı Erişim Sistemi',
                                    style: TextStyle(
                                      color: Color(0xFF1C9578),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 2,
                                top: 44,
                                child: SizedBox(
                                  width: 129,
                                  height: 14,
                                  child: Text(
                                    'Sağlığınız her zaman bizim önceliğimizdir.',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w300,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 15,
                        child: Opacity(
                          opacity: 0.10,
                          child: Container(
                            width: 305,
                            height: 120,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD2416E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 180,
                child: Container(
                  width: 305,
                  height: 56,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(
                                  side: BorderSide(
                                      width: 2, color: Color(0xFFF4B556)),
                                ),
                              ),
                            ),
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://via.placeholder.com/56x56"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 27),
                      Container(
                        width: 56,
                        height: 56,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(
                                  side: BorderSide(
                                      width: 2, color: Color(0xFF388899)),
                                ),
                              ),
                            ),
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://via.placeholder.com/56x56"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 27),
                      Container(
                        width: 56,
                        height: 56,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(
                                  side: BorderSide(
                                      width: 2, color: Color(0xFF912D6A)),
                                ),
                              ),
                            ),
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://via.placeholder.com/56x56"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 27),
                      Container(
                        width: 56,
                        height: 56,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: OvalBorder(
                                  side: BorderSide(
                                      width: 2, color: Color(0xFFAC2424)),
                                ),
                              ),
                            ),
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://via.placeholder.com/56x56"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 140,
                child: Text(
                  'Servisler',
                  style: TextStyle(
                    color: Color(0xFF051328),
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 73,
                child: Container(
                  width: 305,
                  height: 56,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 19,
                        top: 13,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Merhaba,\n',
                                style: TextStyle(
                                  color: Color(0xFF051328),
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: 'Mustafa TAVASLI',
                                style: TextStyle(
                                  color: Color(0xFF051328),
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Opacity(
                          opacity: 0.10,
                          child: Container(
                            width: 305,
                            height: 56,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD2416E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 254,
                        top: 13,
                        child: Container(width: 30, height: 30, child: Stack()),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 64,
                top: 42,
                child: Text(
                  'Sağlık Pusulası',
                  style: TextStyle(
                    color: Color(0xFF051328),
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 0,
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
