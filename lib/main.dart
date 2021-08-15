import 'package:flutter/material.dart';
import 'package:generali/ButtomNavigation.dart';
import 'package:generali/LoginPage.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red, //or set color with: Color(0xFF0000FF)
    ));
    return MaterialApp(
      title: "GENEARALI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ButtomNavigation(),
    );
  }
}
