import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardExampleBottom extends StatelessWidget {
  const CardExampleBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
            color: Color.fromRGBO(251, 236, 241, 1),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: const Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                      color: Color.fromRGBO(247, 219, 228, 1),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              '12 Pzt',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text('11.10',textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Parol',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromRGBO(135, 182, 172, 1),
                          ),
                        ),
                        Text(
                          'Ağrı Kesici',
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        Expanded(
          flex: 1,
            child: IconButton(onPressed: () {}, icon: Icon(Icons.menu))),
        SizedBox(height: 10,)
      ],
    );
  }
}