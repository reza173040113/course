import 'package:flutter/material.dart';
import 'package:generali/ChatPage.dart';
import 'package:generali/LeonizateScrollDetail.dart';
import 'package:generali/NewMenuPage.dart';
import 'package:generali/NewsPage.dart';
import 'package:generali/ProfilePage.dart';

import 'LeonizatePage.dart';
import 'WatchingCourse.dart';

class LeozinateScroll extends StatefulWidget {
  //Getting dni and Passowrd form login
  final String dni, password;
  LeozinateScroll({
    Key key,
    @required this.dni,
    this.password,
  }) : super(key: key);
  @override
  _LeozinateScrollState createState() => _LeozinateScrollState();
}

class _LeozinateScrollState extends State<LeozinateScroll> {
 

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
           
            body:Column(
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
                        )),
                      ],
                    ),
                  ),
                ),
                Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextFormField(
                      cursorColor: Colors.white,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: new InputDecoration(
                        labelText: "Leonizate",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight:FontWeight.bold
                        ),
                        errorStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      validator: (input) {
                        if (input.length == 0) {
                          return "Search cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                    ),
                  ),
                 
                ]),
                LeonizateScrollDetail(),
               
              ],
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
