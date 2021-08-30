import 'dart:async';

import 'package:flutter/material.dart';
import 'package:generali/ButtomNavigation.dart';
import 'package:generali/HomePage.dart';
import 'package:generali/LoginPage.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalToken;

class SplashScreen extends StatefulWidget {
  int initScreen;
  SplashScreen({this.initScreen});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedToken = sharedPreferences.getString("token");
    setState(() {
      finalToken = obtainedToken;
    });
    print("tokennn "+finalToken);
  }

  void startTime() {
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 2),
          () => Get.to(finalToken == null ? LoginPage() : ButtomNavigation()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#c5281c"),
      body: Center(
        child: Image.asset(
          "images/m_logo.png",
          width: MediaQuery.of(context).size.width * .5,
        ),
      ),
    );
  }
}
