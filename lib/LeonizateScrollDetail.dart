import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:generali/LeonizateScroll.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String finalToken;
class LeonizateScrollDetail extends StatefulWidget {
  @override
  _LeonizateScrollDetailState createState() => _LeonizateScrollDetailState();
}

class _LeonizateScrollDetailState extends State<LeonizateScrollDetail> {
  var loading = false;
   List<dynamic> data1;
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
        data1=map['ligadetalle'];
        
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
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              Container(
                height: 90,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 10),
                          child: Text("Medallero",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800)),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 10, top: 10),
                            alignment: Alignment.center,
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                color: HexColor("#c5281c"), shape: BoxShape.circle),
                            child: Text("?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 95),
                height: 200,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin:
                                  EdgeInsets.only(top: 60, left: 20, right: 15),
                              child: Image.asset(
                                "images/App_Assets/medal-silver.png",
                                width: 20,
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 40, right: 15),
                              child: Image.asset(
                                "images/App_Assets/medal-silver.png",
                                width: 40,
                              )),
                          Container(
                              margin: EdgeInsets.only(top: 20, right: 15),
                              child: Image.asset(
                                "images/App_Assets/medal-silver.png",
                                width: 60,
                              )),
                          Container(
                              margin: EdgeInsets.only(right: 10),
                              child: Image.asset(
                                "images/App_Assets/medal-master.png",
                                width: 80,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8, left: 5),
                      child: LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * 0.85,
                        lineHeight: 5.0,
                        percent: 0.0,
                        backgroundColor: Colors.grey[300],
                        progressColor: Colors.yellow,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    "0 pt",
                                    style: TextStyle(color: Colors.grey[300]),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    "967",
                                    style: TextStyle(
                                        color: Colors.grey[100],
                                        fontWeight: FontWeight.bold),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    "usuarios",
                                    style: TextStyle(
                                        color: Colors.grey[100],
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: 10,
                            ),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      "350 pt",
                                      style: TextStyle(color: Colors.grey[300]),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(left: 10, top: 5),
                                    child: Text(
                                      "521",
                                      style: TextStyle(
                                          color: Colors.grey[100],
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      "usuarios",
                                      style: TextStyle(
                                          color: Colors.grey[100],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: 30,
                            ),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      "743 pt",
                                      style: TextStyle(color: Colors.grey[300]),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(left: 10, top: 5),
                                    child: Text(
                                      "167",
                                      style: TextStyle(
                                          color: Colors.grey[100],
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      "usuarios",
                                      style: TextStyle(
                                          color: Colors.grey[100],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              right: 20,
                            ),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      "1015 pt",
                                      style: TextStyle(color: Colors.grey[300]),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(left: 10, top: 5),
                                    child: Text(
                                      "97",
                                      style: TextStyle(
                                          color: Colors.grey[100],
                                          fontWeight: FontWeight.bold),
                                    )),
                                Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: Text(
                                      "usuarios",
                                      style: TextStyle(
                                          color: Colors.grey[100],
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 50),
                  child: Image.asset(
                    "images/App_Assets/medal_oro.png",
                    width: 90,
                  )),
            ]),
            Stack(children: [
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: HexColor("#c5281c"),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 10),
                          child: Text("Tu conocimiento",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800)),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 10, top: 10),
                            alignment: Alignment.center,
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                color: HexColor("#c5281c"),
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Text("?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 65),
                height: 80,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 20),
                            child: Text(
                              "Total",
                              style: TextStyle(color: Colors.white,fontSize:16),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10, top: 20),
                            child: Text("0 hours (%)",
                                style: TextStyle(color: Colors.white,fontSize:16)),
                          )
                        ]),
                    Container(
                      margin: EdgeInsets.only(top: 8, left: 5),
                      child: LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * 0.85,
                        lineHeight: 14.0,
                        percent: 1.0,
                        backgroundColor: Colors.grey[300],
                        progressColor: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            Stack(children: [
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.9,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                    color: HexColor("#c5281c"),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 10),
                          child: Text("Tu iniciativa",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800)),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 10, top: 10),
                            alignment: Alignment.center,
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                color: HexColor("#c5281c"),
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Text("?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20))),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 65),
                height: 80,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, top: 20),
                            child: Text(
                              "Total",
                              style: TextStyle(color: Colors.white,fontSize:16),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10, top: 20),
                            child: Text("0 hours (%)",
                                style: TextStyle(color: Colors.white,fontSize:16)),
                          )
                        ]),
                    Container(
                      margin: EdgeInsets.only(top: 8, left: 5),
                      child: LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * 0.85,
                        lineHeight: 14.0,
                        percent: 1.0,
                        backgroundColor: Colors.grey[300],
                        progressColor: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
