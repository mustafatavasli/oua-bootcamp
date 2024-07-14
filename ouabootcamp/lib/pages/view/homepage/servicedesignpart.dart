import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ouabootcamp/pages/view/AlerjilerScreen.dart';
import 'package:ouabootcamp/pages/view/MedList.dart';
import 'package:ouabootcamp/pages/view/YakinlarimScreen.dart';

class ServicesDesign extends StatelessWidget {
  const ServicesDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 1, color: Colors.yellow)),
              child: IconButton(
                icon: Image.asset('assets/images/ilac.png',height: 60,),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MedList()),
                  );
                },
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 1, color: Color.fromRGBO(100, 162, 175,1))),
              child: IconButton(
                icon: Image.asset('assets/images/hastaliklar.png',height: 60,),
                onPressed: () {},
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 1, color: Color.fromRGBO(140, 43, 102,1))),
              child: IconButton(
                icon: Image.asset('assets/images/Alerjiler.png',height: 60,),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AlerjilerScreen()),
                  );
                },
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 1, color: Colors.red)),
              child: IconButton(
                icon: Image.asset('assets/images/yakinlarim.png',height: 60,),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YakinlarimScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}