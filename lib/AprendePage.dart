import 'package:flutter/material.dart';
import 'package:generali/AprendeDetail.dart';
import 'package:generali/ButtomNavigation.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
              child: profileRow,
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
                  Row(
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
                            Text("89",
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                            Text("9",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Pendients")
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
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
                            Text("27/03/2009",
                                style: TextStyle(fontWeight: FontWeight.bold)),
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
                            Text("1306",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Horas Totales")
                          ],
                        ),
                      ),
                    ],
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
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 4.0),
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
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 10, left: 10),
                              child: Text(data[index],
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Container(
                            margin: EdgeInsets.only(bottom: 10, left: 10),
                            child: Row(
                              children: [
                                Icon(Icons.sanitizer),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Text("1.30"),
                                ),
                                Icon(Icons.wifi),
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Text("Online"),
                                ),
                                Icon(Icons.flag),
                                Container(
                                  child: Text("Completado"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ));
                    })),
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
