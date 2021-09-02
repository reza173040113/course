import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generali/ChatPage.dart';
import 'package:generali/NewsPage.dart';
import 'package:generali/ProfilePage.dart';
import 'package:generali/widget/SearchPage.dart';
import 'package:generali/widget/SearchWidget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'LeonizatePage.dart';
import 'WatchingCourse.dart';

class HomePage extends StatefulWidget {
  //Getting dni and Passowrd form login
  // final String dni, password;
  // HomePage({
  //   Key key,
  //   @required this.dni,
  //   this.password,
  // }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool satuVal = false;
  bool duaVal = false;
  bool tigaVal = false;
  int groupValue = 0;
  String value = "";
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  void buttonValue(int v) {
    setState(() {
      groupValue = v;
    });
  }

  void onSubmitted(String value) {
    setState(() {
      return _globalKey.currentState.showSnackBar(
        SnackBar(content: Text('$value!')),
      );
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
            // extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,

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
                // ExamplePage(),
                SearchPage(),
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
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyApp()));
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 30),
                                child: Text("View",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.red)),
                              ),
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
          Stack(children: [
            // Container(
            //   margin: EdgeInsets.only(
            //     left: 20,
            //   ),
            //   width: MediaQuery.of(context).size.width * 0.8,
            //   child: TextFormField(
            //     cursorColor: Colors.white,
            //     obscureText: true,
            //     style: TextStyle(color: Colors.white),
            //     decoration: new InputDecoration(
            //       labelText: "Search",
            //       labelStyle: TextStyle(
            //         color: Colors.grey,
            //         fontSize: 20.0,
            //       ),
            //       errorStyle: TextStyle(
            //         color: Colors.white,
            //         fontSize: 18.0,
            //       ),
            //       fillColor: Colors.white,
            //       filled: true,
            //       border: new OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(25.0),
            //       ),
            //       enabledBorder: new OutlineInputBorder(
            //         borderRadius: new BorderRadius.circular(25.0),
            //         borderSide: BorderSide(color: Colors.white),
            //       ),
            //       focusedBorder: new OutlineInputBorder(
            //         borderRadius: new BorderRadius.circular(25.0),
            //         borderSide: BorderSide(
            //           color: Colors.white,
            //         ),
            //       ),
            //     ),
            //     validator: (input) {
            //       if (input.length == 0) {
            //         return "Search cannot be empty";
            //       } else {
            //         return null;
            //       }
            //     },
            //     keyboardType: TextInputType.text,
            //   ),
            // ),
            // Container(
            //   alignment: Alignment.centerRight,
            //   margin: EdgeInsets.only(right: 30),
            //   child: Container(
            //       width: 60,
            //       height: 60,
            //       decoration: BoxDecoration(
            //           color: HexColor("#c5281c"),
            //           borderRadius: BorderRadius.circular(10)),
            //       child: IconButton(
            //           icon: Icon(
            //         Icons.search,
            //         color: Colors.white,
            //       ))),
            // )
            // searchBarUI()
          ]),
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

  Widget searchBarUI() {
    List<String> list = [
      'Baik Sekali',
      'Baik',
      'Kurang Baik',
      'Kurang Baik Sekali'
    ];
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 70, left: 10, right: 10),
      child: FloatingSearchBar(
        padding: EdgeInsets.only(left: 10),
        hint: 'Search.....',
        borderRadius: BorderRadius.circular(20),
        openAxisAlignment: 0.0,
        maxWidth: 500,
        axisAlignment: 0.0,
        scrollPadding: EdgeInsets.only(top: 16, bottom: 20),
        elevation: 4.0,
        physics: BouncingScrollPhysics(),
        onQueryChanged: (query) {
          //Your methods will be here
        },
        showDrawerHamburger: false,
        transitionCurve: Curves.easeInOut,
        transitionDuration: Duration(milliseconds: 500),
        transition: CircularFloatingSearchBarTransition(),
        debounceDelay: Duration(milliseconds: 500),
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: Container(
              width: 50,
              child: RaisedButton(
                padding: EdgeInsets.only(right: 2, left: 4),
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  print('Places Pressed');
                },
              ),
            ),
          ),
          FloatingSearchBarAction.searchToClear(
            showIfClosed: false,
          ),
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Status"),
                    DropdownButton<String>(
                      isExpanded: true,
                      items: list
                          .map((listTitle) => DropdownMenuItem(
                              value: listTitle, child: Text("$listTitle")))
                          .toList(),
                      onChanged: (_value) => {
                        print(_value.toString()),
                        setState(() {
                          value = _value;
                        }),
                      },
                      hint: Text("Pilih"),
                    ),
                    Text("Area"),
                    DropdownButton<String>(
                      isExpanded: true,
                      items: list
                          .map((listTitle) => DropdownMenuItem(
                              value: listTitle, child: Text("$listTitle")))
                          .toList(),
                      onChanged: (_value) => {
                        print(_value.toString()),
                        setState(() {
                          value = _value;
                        }),
                      },
                      hint: Text("Pilih"),
                    ),
                    Text("Kesatu"),
                    DropdownButton<String>(
                      isExpanded: true,
                      items: list
                          .map((listTitle) => DropdownMenuItem(
                              value: listTitle, child: Text("$listTitle")))
                          .toList(),
                      onChanged: (_value) => {
                        print(_value.toString()),
                        setState(() {
                          value = _value;
                        }),
                      },
                      hint: Text("Pilih"),
                    ),
                    // Text("Kedua"), // radio button
                    // DropdownButton<String>(
                    //   isExpanded: true,
                    //   items: [
                    //     DropdownMenuItem<String>(
                    //       child: Row(
                    //         children: [
                    //           Radio(
                    //             value: 1,
                    //             activeColor: Colors.red,
                    //             groupValue: groupValue,
                    //             onChanged: (int v) {
                    //               print(v);
                    //               buttonValue(v);
                    //             },
                    //           ),
                    //           Text("1"),
                    //         ],
                    //       ),
                    //     ),
                    //     DropdownMenuItem<String>(
                    //       child: Row(
                    //         children: [
                    //           Radio(
                    //             value: 2,
                    //             activeColor: Colors.red,
                    //             groupValue: groupValue,
                    //             onChanged: (int v) {
                    //               print(v);
                    //               buttonValue(v);
                    //             },
                    //           ),
                    //           Text("2"),
                    //         ],
                    //       ),
                    //     ),
                    //     DropdownMenuItem<String>(
                    //       child: Row(
                    //         children: [
                    //           Radio(
                    //             value: 3,
                    //             activeColor: Colors.red,
                    //             groupValue: groupValue,
                    //             onChanged: (int v) {
                    //               print(v);
                    //               buttonValue(v);
                    //             },
                    //           ),
                    //           Text("3"),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    //   onChanged: (_value) => {
                    //     print(_value.toString()),
                    //     setState(() {
                    //       value = _value;
                    //     }),
                    //   },
                    //   hint: Text("Pilih lagi"),
                    // ),
                    // Text("Ketiga"), // radio button
                    // DropdownButton<String>(
                    //   isExpanded: true,
                    //   items: [
                    //     DropdownMenuItem<String>(
                    //       child: Row(
                    //         children: [
                    //           Checkbox(
                    //             activeColor: Colors.red,
                    //             value: satuVal,
                    //             onChanged: (bool value) {
                    //               setState(() {
                    //                 satuVal = value;
                    //               });
                    //             },
                    //           ),
                    //           Text("1"),
                    //         ],
                    //       ),
                    //     ),
                    //     DropdownMenuItem<String>(
                    //       child: Row(
                    //         children: [
                    //           Checkbox(
                    //             activeColor: Colors.red,
                    //             value: duaVal,
                    //             onChanged: (bool value) {
                    //               setState(() {
                    //                 duaVal = value;
                    //               });
                    //             },
                    //           ),
                    //           Text("2"),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    //   onChanged: (_value) => {
                    //     print(_value.toString()),
                    //     setState(() {
                    //       value = _value;
                    //     }),
                    //   },
                    //   hint: Text("Pilih lagi yu"),
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
