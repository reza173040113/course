import 'package:flutter/material.dart';
import 'package:generali/AprendePage.dart';
import 'package:generali/ChatPage.dart';
import 'package:generali/NewsPage.dart';
import 'package:generali/ProfilePage.dart';
import 'package:generali/RegeneratePage.dart';
import 'package:hexcolor/hexcolor.dart';

import 'HomePage.dart';

class ButtomNavigation extends StatefulWidget {
  //Getting dni and Passowrd form login
  final String dni, password;
  ButtomNavigation({
    Key key,
    @required this.dni,
    this.password,
  }) : super(key: key);
  @override
  _ButtomNavigationState createState() => _ButtomNavigationState();
}

class _ButtomNavigationState extends State<ButtomNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = [
    HomePage(),
    AprendePage(),
    RegeneratePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            "images/bg.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Aprende',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'Regenrate',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: HexColor("#c5281c"),
              selectedLabelStyle: TextStyle(
                fontSize: 16.0,
              ),
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              unselectedItemColor: Colors.grey,
            ),
            body: _widgetOptions[_selectedIndex],
            //TODO: bg

         
          ),
        ],
      ),
    );
  }

  void navigateToNextScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ChatPage()));
  }

  void navigateToProfileScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ProfilePage()));
  }
}
