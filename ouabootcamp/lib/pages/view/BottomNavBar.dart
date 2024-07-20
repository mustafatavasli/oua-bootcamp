import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ouabootcamp/pages/view/MedList.dart';
import 'package:ouabootcamp/pages/view/ProfileScreen.dart';
import 'package:ouabootcamp/pages/view/homepage/HomeScreen.dart';


class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 90,
        height: 90,
        margin: EdgeInsets.only(top: 10),
        child: FloatingActionButton(
          backgroundColor: Color.fromRGBO(251, 236, 241,1),
          elevation: 0,
          onPressed: () {

          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          child: Image.asset(
              "assets/images/navgemini.png",
            fit: BoxFit.fill,
            width: 80,
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color.fromRGBO(251, 236, 241,1),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: ImageIcon(
              AssetImage("assets/images/navhome.png"),
            ),
            label: '',
          ),

          NavigationDestination(
            icon: ImageIcon(
              AssetImage("assets/images/navprofile.png"),
            ),
            label: '',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        HomeScreen(),
        /// Profile,
        ProfileScreen(),
      ][currentPageIndex],
    );
  }
}