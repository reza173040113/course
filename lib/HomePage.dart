import 'package:flutter/material.dart';
import 'package:generali/ChatPage.dart';
import 'package:generali/ProfilePage.dart';

class HomePage extends StatefulWidget {
  //Getting dni and Passowrd form login
  final String dni, password;
  HomePage({
    Key key,
    @required this.dni,
    this.password,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Aprende',
      style: optionStyle,
    ),
    Text(
      'Regenrate',
      style: optionStyle,
    ),
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

            body: Container(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "images/m_logo.png",
                      width: 120.0,
                      height: 120.0,
                    ),
                    Container(
                        child: Row(
                      children: [
                        IconButton(
                          color: Colors.white,
                          icon: Image.asset('images/tutor_icon_white.png'),
                          onPressed: () {
                            navigateToNextScreen(context);
                          },
                        ),
                        IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.notifications),
                          onPressed: () {
                            navigateToNextScreen(context);
                          },
                        ),
                        IconButton(
                          color: Colors.white,
                          icon: Image.asset('images/profile.png'),
                          onPressed: () {
                            navigateToProfileScreen(context);
                          },
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),

            //TODO: bg
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
              selectedItemColor: Colors.red,
              selectedLabelStyle: TextStyle(
                fontSize: 16.0,
              ),
              onTap: _onItemTapped,
              unselectedItemColor: Colors.grey,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigateToNextScreen(context);
              },
              child: Icon(Icons.chat),
              splashColor: Colors.white,
            ),
          )
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
