import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:generali/AprendeDetail.dart';
import 'package:generali/ButtomNavigation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String finalToken;
int id;

class AprendePage extends StatefulWidget {
  @override
  _AprendePageState createState() => _AprendePageState();
}

class _AprendePageState extends State<AprendePage> {
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
  List<Map<String, dynamic>> data3;
  Map<String, dynamic> map;
  Future getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");
    int idUser = sharedPreferences.getInt("id");
    setState(() {
      loading = true;
      finalToken = obtainedToken;
      id = idUser;
    });
    print("token final $finalToken");
    print("ida user $id");
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $finalToken'
    };
    final responseData = await http.get(
        "https://precampusgenerali.enzymeadvisinggroup.com/api2/api/v2/me/training_passport/$id",
        headers: headers);

    if (responseData.statusCode == 200) {
      map = json.decode(responseData.body);
      print(map);
      if (this.mounted) {
        setState(() {
          data1 = map['courseDetail'];
          data2 = map["globalsituation"];
          //  data3=List<Map<String, dynamic>>.from(json.decode(responseData.body)['user']);
          // data3 = map['user'];
          //  print("data user " + data3[0]['firstname']);
          // print(data.length);
        });
      }
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
              color: HexColor("#c5281c"),
              padding: EdgeInsets.all(8.0),
              //TODO: Profile Picture's row
              child: map != null
                      ?Row(
                children: <Widget>[
                  Container(
                    width: 72.0,
                    height: 72.0,
                    child: map['user']['pathimage'] != null
                        ? Image.network(
                            map['user']['pathimage'],
                            fit: BoxFit.fill,
                          ):Image.asset("images/profile.png", fit: BoxFit.fill)
                         
                  ),
                   Container(
                          margin: EdgeInsets.only(right: 24.0, left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                map['user']['firstname'],
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              Text(
                                map['user']['lastname'],
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ))
                      ,
                ],
              ): Center(child: CircularProgressIndicator()),
              // : Center(child: CircularProgressIndicator()),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 4.0),
              width: MediaQuery.of(context).size.width,
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
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: HexColor("#c5281c"),
                            width: 3.0,
                          ))),
                          child: Text("Cursos",
                              style: TextStyle(color: HexColor("#c5281c")))),
                      Container(
                        margin: EdgeInsets.only(right: 10, top: 10),
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AprendeDetail()));
                                  },
                                  child: Text("Details",
                                      style: TextStyle(
                                          color: HexColor("#c5281c"))),
                                )),
                            Image.asset(
                              "images/App_Assets/right-nav-active.png",
                              width: 10,
                              color: HexColor("#c5281c"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  data2 != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 30, right: 10),
                              width: 120,
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: HexColor("#c5281c"), width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(data2[0]['finished'].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text("Completados")
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30, right: 10),
                              width: 120,
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: HexColor("#c5281c"), width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(data2[0]['pending'].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text("Pendients")
                                ],
                              ),
                            ),
                          ],
                        )
                      : Center(child: CircularProgressIndicator()),
                  data2 != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 10),
                              width: 120,
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: HexColor("#c5281c"), width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(data2[0]['first_date'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text("Primera fecha inicia"))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 10),
                              width: 120,
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: HexColor("#c5281c"), width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(data2[0]['total_time'].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text("Horas Totales")
                                ],
                              ),
                            ),
                          ],
                        )
                      : Center(child: CircularProgressIndicator()),
                  data2 != null
                      ? Container(
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(data2[0]['score'].toString(),
                              style: TextStyle(fontWeight: FontWeight.bold)))
                      : Center(child: CircularProgressIndicator()),
                  data2 != null
                      ? Container(
                          margin: EdgeInsets.only(top: 8, left: 5, bottom: 10),
                          child: LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width * 0.95,
                            lineHeight: 5.0,
                            percent: data2[0]['score'].toDouble(),
                            backgroundColor: Colors.black,
                            progressColor: Colors.yellow,
                          ),
                        )
                      : Center(child: CircularProgressIndicator()),
                  Text("Nota media (aprobodas)")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 4.0),
              color: HexColor("#c5281c"),
              child: Text(
                "Cursos",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: data1 != null
                    ? ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: data1.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(bottom: 10, left: 10),
                                  child: Text(data1[index]['title'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))),
                              Container(
                                margin: EdgeInsets.only(bottom: 10, left: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.sanitizer),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Text(data1[index]['duration']),
                                    ),
                                    Icon(Icons.wifi),
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Text(data1[index]['modality']),
                                    ),
                                    Icon(Icons.flag),
                                    Container(
                                      child: Text(data1[index]['status']),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ));
                        })
                    : Center(child: CircularProgressIndicator())),
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
