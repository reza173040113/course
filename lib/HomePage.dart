import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generali/ChatPage.dart';
import 'package:generali/NewsPage.dart';
import 'package:generali/ProfilePage.dart';
import 'package:hexcolor/hexcolor.dart';

import 'LeonizatePage.dart';
import 'WatchingCourse.dart';

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
            // extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,

            body: Column(
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
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      cursorColor: Colors.white,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      decoration: new InputDecoration(
                        labelText: "Search",
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 20.0,
                        ),
                        errorStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        border: new OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
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
                  Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 30),
                    child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: HexColor("#c5281c"),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                            icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ))),
                  )
                ]),
                LeonizatePage(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 30, left: 20),
                        child: Text(
                          "News",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 30, right: 20),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 30),
                              child: Text("View",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.red)),
                            ),
                            Image.asset(
                              "images/App_Assets/right-nav-active.png",
                              width: 8,
                              color: Colors.red,
                            )
                          ],
                        ))
                  ],
                ),
              ],
            ),

              floatingActionButton: FloatingActionButton(
              onPressed: () {
                navigateToNextScreen(context);
              },
              child: Icon(Icons.chat),
              splashColor: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 480),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              children: [NewsPage(), WatchingCourse()],
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
