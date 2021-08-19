import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class NewMenuPage extends StatefulWidget {
  @override
  _NewMenuPageState createState() => _NewMenuPageState();
}

class _NewMenuPageState extends State<NewMenuPage> {
  final List data = [
    "Lorem ipsum",
    "Lorem Ipsum",
    "Lorem Ipsum",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset(
            "images/bg_gradient.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text(
                'Volver',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(24.0, 100.0, 24.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(8.0),
                      //TODO: Profile Picture's row
                      child: profileRow,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 4.0),
                      width: MediaQuery.of(context).size.width,
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
                              Text("Cursos"),
                              Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Text("Details")),
                                  Image.asset(
                                    "images/App_Assets/right-nav-active.png",
                                    width: 10,
                                    color: Colors.red,
                                  )
                                ],
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
                                        color: Colors.redAccent, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("89",
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
                                        color: Colors.redAccent, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("9",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
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
                                        color: Colors.redAccent, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("27/03/2009",
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
                                        color: Colors.redAccent, width: 1),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("1306",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          Container(
                            margin:
                                EdgeInsets.only(top: 8, left: 5, bottom: 10),
                            child: LinearPercentIndicator(
                              width: MediaQuery.of(context).size.width * 0.85,
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
                                      margin:
                                          EdgeInsets.only(bottom: 10, left: 10),
                                      child: Text(data[index],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                                  Container(
                                    margin:
                                        EdgeInsets.only(bottom: 10, left: 10),
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
                    Container(
                      padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 4.0),
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
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Stack(children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Cursos",
                                    style: TextStyle(color: Colors.red)),
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text("Print",
                                            style:
                                                TextStyle(color: Colors.red))),
                                    Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.print,
                                          color: Colors.red,
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                    children: [
                                      Text("89",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                    children: [
                                      Text("89",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red)),
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
                                              color: Colors.red)),
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
                                              color: Colors.red)),
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
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            Container(
                              margin:
                                  EdgeInsets.only(top: 8, left: 5, bottom: 10),
                              child: LinearPercentIndicator(
                                width: MediaQuery.of(context).size.width * 0.85,
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
                          margin: EdgeInsets.only(top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(left: 90),
                                  height: 170,
                                  child: VerticalDivider(
                                    color: Colors.red,
                                    thickness: 2,
                                  )),
                              Container(
                                  margin: EdgeInsets.only(right: 100),
                                  height: 170,
                                  child: VerticalDivider(
                                    color: Colors.red,
                                    thickness: 2,
                                  )),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 4.0),
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                    children: [
                                      Text("Primera Fecha"),
                                      Text("inicia")
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Primera Fecha"),
                                      Text("inicia")
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Primera Fecha"),
                                      Text("inicia")
                                    ],
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
                                    color: Colors.red,
                                    thickness: 2,
                                  )),
                              Container(
                                  margin: EdgeInsets.only(right: 100),
                                  height: 105,
                                  child: VerticalDivider(
                                    color: Colors.red,
                                    thickness: 2,
                                  )),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Top Profile low, below AppBar
// Contains profile picture, Name, and two buttons
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
