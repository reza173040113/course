import 'package:flutter/material.dart';
import 'package:generali/ButtomNavigation.dart';
import 'package:generali/LoginPage.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'SplashScreen.dart';

void main() => runApp(MyApp());
String finalToken;
class MyApp extends StatefulWidget {
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.red, //or set color with: Color(0xFF0000FF)
    // ));
    return GetMaterialApp(
      title: "GENEARALI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashScreen()
    
    );
  }
}
