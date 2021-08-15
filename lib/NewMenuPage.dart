import 'package:flutter/material.dart';

class NewMenuPage extends StatefulWidget {
  @override
  _NewMenuPageState createState() => _NewMenuPageState();
}

class _NewMenuPageState extends State<NewMenuPage> {
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
                '< Volver',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            body: Container(
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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Cursos"), Text("Details >")],
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
                              child: Center(child: Text("89 \n Completados")),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30, ),
                              width: 120,
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.redAccent, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(child: Text("9 \n Pendients")),
                            )
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
                              child: Center(child: Text("27/03/2009 \n Primera Fecha inicia")),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, ),
                              width: 120,
                              height: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.redAccent, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(child: Text("1306 \n Horas Totales")),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 4.0),
                    child: Text(
                      "Datos Acceso Gener@mobile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
              
                  ),
                 
                ],
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
          margin: EdgeInsets.only(right: 24.0,left:10),
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
