import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:generali/Category.dart';
import 'package:generali/VideoPlayer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'ButtomNavigation.dart';
import 'core/models/offering_models.dart';

String finalToken;

class Volver extends StatefulWidget {
  final int id;
  Volver({@required this.id});
  @override
  _VolverState createState() => _VolverState();
}

class _VolverState extends State<Volver> {
  var loading = false;
  var body;
  Map<String, dynamic> map;
  List<ModelOffering> listModel = [];
  Future getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");
    setState(() {
      loading = true;
      finalToken = obtainedToken;
    });
    print("token final $finalToken");
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $finalToken'
    };
    final responseData = await http.get(
        "https://precampusgenerali.enzymeadvisinggroup.com/api2/api/v2/media-support/${widget.id}",
        headers: headers);

    if (responseData.statusCode == 200) {
      if (this.mounted) {
        setState(() {
          map = json.decode(responseData.body);
          print(map);
          // print("data news1 " + data[0]["title"]);
          // print(data.length);
        });
      }
    }

    // print("dataaaaaaaaaaaaa" + listModel[0].title);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print('idd ${widget.id}');
    return Scaffold(
      body: ListView(children: [
        Stack(
          children: [
            Container(
              child: Column(children: [
                //video
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    child: Image.network(
                        "https://images.unsplash.com/photo-1568292342316-60aa3d36f4b3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d2FscGFwZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80"),
                    // child: VideoApp(),
                  ),
                ),
                // Container(
                //   height: 10,
                //   color: Colors.grey,
                // ),
                map != null
                    ? Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  // width: 0,
                                  margin: EdgeInsets.only(
                                      left: 9, top: 6, bottom: 5),
                                  child: Text(
                                    map['title'],
                                  )),
                              Container(
                                child: LinearPercentIndicator(
                                  width: 320.0,
                                  lineHeight: 5.0,
                                  percent: 0.1,
                                  progressColor: Colors.red,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "10%",
                                    style: TextStyle(
                                        color: Colors.grey[400], fontSize: 11),
                                  ),
                                  SizedBox(
                                    height: 20,
                                    // width: 10,
                                  ),
                                  Text("Iniciado",
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 11)),

                                  // Align(
                                  //     child: Container(
                                  //   margin: EdgeInsets.only(left: 9, top: 6, bottom: 5),
                                  //   child: Text("10%"),
                                  // )),
                                  // Align(
                                  //     alignment: Alignment.centerRight,
                                  //     child: Container(
                                  //       color: Colors.blueGrey,
                                  //       child: Text("iniciado"),
                                  //     ))
                                ],
                              )
                            ]))
                    : Center(child: CircularProgressIndicator()),
              ]),
            ),
            Positioned(
                left: 10,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ButtomNavigation()));
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        )),
                    Text(
                      "Volver",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )),
          ],
        ),

        //tab Bar
        Container(
          height: 4,
          color: Colors.grey[400],
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(10),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red[900],
                      ),
                      //
                    ),
                  ),
                  map['duration'] != null
                      ? Container(
                          child: Text(map['duration'],
                              style: TextStyle(
                                  fontSize: 11, color: Colors.grey[400])),
                        )
                      : Center(child: CircularProgressIndicator()),
                ],
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red[900],
                      ),
                      //
                    ),
                  ),
                  map['type'] != null
                      ? Container(
                          child: Text(map['type'],
                              style: TextStyle(
                                  fontSize: 11, color: Colors.grey[400])),
                        )
                      : Center(child: CircularProgressIndicator()),
                ],
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red[900],
                      ),
                      //
                    ),
                  ),
                  Container(
                    child: Text("Habilidades",
                        style:
                            TextStyle(fontSize: 11, color: Colors.grey[400])),
                  )
                ],
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red[900],
                      ),
                      //
                    ),
                  ),
                  Container(
                    child: Text("Liderazgo",
                        style:
                            TextStyle(fontSize: 11, color: Colors.grey[400])),
                  )
                ],
              ),
            ],
          ),
        ),

        Container(
          height: 4,
          color: Colors.grey[400],
        ),

        DefaultTabController(
            length: 3, // length of tabs
            initialIndex: 0,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: TabBar(
                      labelColor: Colors.green,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(text: 'Contenidos'),
                        Tab(text: 'Compatibilidad'),
                        Tab(text: 'Observaciones'),
                      ],
                    ),
                  ),
                  Container(
                      height: 300, //height of TabBarView
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Colors.grey[400], width: 5))),
                      child: TabBarView(children: <Widget>[
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  for (int i = 0; i < 5; i++)
                                    Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Icon(Icons.star,
                                            size: 14, color: Colors.yellow))
                                ],
                              ),
                              for (int i = 1; i <= 5; i++)
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                      i.toString() +
                                          '. Display Tab ' +
                                          i.toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => VideoApp()));
                                },
                                child: Container(
                                  width: 150,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.red[900],
                                  ),
                                  child: Center(
                                      child: Text("Accede al soporte",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ))),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 1; i <= 5; i++)
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                      i.toString() +
                                          '. Display Tab ' +
                                          i.toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (int i = 1; i <= 5; i++)
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                      i.toString() +
                                          '. Display Tab ' +
                                          i.toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                      )),
                                ),
                            ],
                          ),
                        ),
                      ]))
                ])),
        Container(
          height: 4,
          color: Colors.grey[400],
        ),
        Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        // padding: EdgeInsets.all(10),
                        width: 80,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red[900],
                        ),
                        child: Center(
                            child: Text("evaluacion",
                                style: TextStyle(color: Colors.white))),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red[900],
                        ),
                        child: Center(
                            child: Text("Estado",
                                style: TextStyle(color: Colors.white))),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 70,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red[900],
                        ),
                        child: Center(
                            child: Text("Acceso",
                                style: TextStyle(color: Colors.white))),
                      ),
                    ]),
              ),
              Container(
                color: Colors.grey[200],
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(child: Text("Contenidos")),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 15,
                            color: Colors.red[900],
                          ),
                          Container(
                            child: Wrap(children: [
                              map != null
                                  ? Text(
                                      map['description'],
                                      style: Theme.of(context)
                                          .primaryTextTheme
                                          .caption
                                          .copyWith(color: Colors.black),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                    )
                                  : Center(child: CircularProgressIndicator()),
                            ]),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.grey[200],
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 70),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    // padding: EdgeInsets.all(10),
                    width: 80,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red[900],
                    ),
                    child: Center(
                        child: Text("Inclompet",
                            style: TextStyle(color: Colors.white))),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => VideoApp()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      width: 70,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red[900],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VideoApp()));
                            },
                            child: Center(
                                child: Text("Entrar",
                                    style: TextStyle(color: Colors.white))),
                          ),
                          Image.asset(
                            "images/App_Assets/right-nav-active.png",
                            width: 8,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
