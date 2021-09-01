import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:generali/ButtomNavigation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
String finalToken;
class AprendeDetail extends StatefulWidget {
  @override
  _AprendeDetailState createState() => _AprendeDetailState();
}

class _AprendeDetailState extends State<AprendeDetail> {
  final List data = [
    "Lorem ipsum",
    "Lorem Ipsum",
    "Lorem Ipsum",
    "Lorem ipsum",
    "Lorem Ipsum",
    "Lorem Ipsum",
  ];
  var loading = false;
   List<dynamic> data1;
  List<dynamic> data2;
  Map<String, dynamic> map;
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
        "https://precampusgenerali.enzymeadvisinggroup.com/api2/api/v2/me/training_passport/58726",
        headers: headers);

    if (responseData.statusCode == 200) {
      map = json.decode(responseData.body);
      print(map);
      setState(() {
        data1=map['courseDetail'];
        data2 = map["globalsituation"];
        // print("data news1 " + data[0]["title"]);
        print(data.length);
      });
    }

    // print("haii"+jsonDecode(responseData.body));
    //
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor("#c5281c"),
          elevation: 0.0,
          title: Row(
            children: [

              // IconButton(
              //   icon: Icon(Icons.arrow_back_ios),
              //   onPressed: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => ButtomNavigation()));
              //   },
              // ),

              Text(
                'Volver',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 4.0),
              color: HexColor("#c5281c"),
              child: Text(
                "Actividad formativo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
              width: MediaQuery.of(context).size.width,
              height: 330,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin:
                                EdgeInsets.only(left: 10, top: 10, bottom: 20),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                              color: HexColor("#c5281c"),
                              width: 3.0,
                            ))),
                            child: Text("Cursos",
                                style: TextStyle(
                                  color: HexColor("#c5281c"),
                                ))),
                        Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text("Print",
                                    style: TextStyle(color: HexColor("#c5281c")))),
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.print,
                                  color: HexColor("#c5281c"),
                                ))
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("89",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("Completados")
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("9",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("Pendients")
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("1306",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("Horas Totales")
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 4,
                    ),
                    data2!=null?Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(data2[0]['first_date'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("Primiera Fecha inicia",style:TextStyle(fontSize: 10))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(data2[0]['end_date'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("Primiera Fecha inicia",style:TextStyle(fontSize: 10))
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(data2[0]['last_visit'],
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("Primiera Fecha inicia",style:TextStyle(fontSize: 10))
                            ],
                          ),
                        ),
                      ],
                    ):Center(child: CircularProgressIndicator()),
                    Divider(
                      thickness: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("89",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#c5281c"))),
                              Text(
                                "Horao de information",
                                style: TextStyle(fontSize: 10),
                              ),
                              Text(
                                "2020",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("89",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#c5281c"))),
                              Text(
                                "Horao de information",
                                style: TextStyle(fontSize: 10),
                              ),
                              Text(
                                "2020",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("89",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#c5281c"))),
                              Text(
                                "Horao de information",
                                style: TextStyle(fontSize: 10),
                              ),
                              Text(
                                "2020",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 4,
                    ),
                    Container(
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text("80.50",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    Container(
                      margin: EdgeInsets.only(top: 8, left: 5, bottom: 10),
                      child: LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * 0.95,
                        lineHeight: 5.0,
                        percent: 0.8,
                        backgroundColor: Colors.black,
                        progressColor: Colors.yellow,
                      ),
                    ),
                    Text("Nota media (aprobodas)")
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 90),
                          height: 170,
                          child: VerticalDivider(
                            color: HexColor("#c5281c"),
                            thickness: 2,
                          )),
                      Container(
                          margin: EdgeInsets.only(right: 100),
                          height: 170,
                          child: VerticalDivider(
                            color: HexColor("#c5281c"),
                            thickness: 2,
                          )),
                    ],
                  ),
                ),
              ]),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 4.0),
              color: HexColor("#c5281c"),
              child: Text(
                "Itenaraios",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
              width: MediaQuery.of(context).size.width,
              height: 125,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("0",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("Completados")
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("0",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("Pendients")
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("0",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("Horas Totales")
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Primera Fecha"), Text("inicia")],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Primera Fecha"), Text("inicia")],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Primera Fecha"), Text("inicia")],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 4,
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 90),
                          height: 105,
                          child: VerticalDivider(
                            color: HexColor("#c5281c"),
                            thickness: 2,
                          )),
                      Container(
                          margin: EdgeInsets.only(right: 100),
                          height: 105,
                          child: VerticalDivider(
                            color: HexColor("#c5281c"),
                            thickness: 2,
                          )),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ));
  }

  final profileRow = Row(
    children: <Widget>[
      Container(
        width: 72.0,
        height: 72.0,
        child: Image.asset(
          "images/profile.png",
          fit: BoxFit.fill,
        ),
      ),
      Container(
          margin: EdgeInsets.only(right: 24.0, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                'name',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ],
          )),
    ],
  );
}
