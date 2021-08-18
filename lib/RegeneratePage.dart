import 'package:flutter/material.dart';
import 'package:generali/ChatPage.dart';
import 'package:generali/LeonizateScrollDetail.dart';
import 'package:generali/NewsPage.dart';
import 'package:generali/ProfilePage.dart';

import 'Category.dart';
import 'HomePage.dart';
import 'LeonizatePage.dart';
import 'WatchingCourse.dart';

class RegeneratePage extends StatefulWidget {
  //Getting dni and Passowrd form login
  final String dni, password;
  RegeneratePage({
    Key key,
    @required this.dni,
    this.password,
  }) : super(key: key);
  @override
  _RegeneratePageState createState() => _RegeneratePageState();
}

class _RegeneratePageState extends State<RegeneratePage> {
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

            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
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
                                icon:
                                    Image.asset('images/tutor_icon_white.png'),
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
                          )),
                        ],
                      ),
                    ),
                  ),
                  
                  Category(),
                ],
              ),
            ),

            //TODO: bg

            floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigateToNextScreen(context);
              },
              child: Icon(Icons.chat),
              splashColor: Colors.white,
            ),
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
