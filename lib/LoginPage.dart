import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:generali/ButtomNavigation.dart';
import 'package:http/http.dart' as http;

import 'package:generali/HomePage.dart';
import 'dart:io'; // for using HttpClient
import 'dart:convert'; // for using json.decode()

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  String dni, password;
  bool _autovalidate = false;
  signInMethod(String email, String password) async {
      print(email + "dan" + password);

    final response = await http.post(
        "https://precampusgenerali.enzymeadvisinggroup.com/api2/authenticate",
        body: {"dni": email, "password": password},headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded'
      });
    var jsonResponse = null;
    print("haiiii"+response.body);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        print(jsonResponse['token']); // for Printing the token

        // Navigator used to enter inside app if the authentication is correct
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => ButtomNavigation(),
            ),
            (Route<dynamic> route) => false);
      }
    } else {
      print("Error message like email or password wrong!!!!"); // Toast
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          //TODO: Background Image Here
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg_login.png"),
              fit: BoxFit.fill,
            ),
          ),
          //TODO: Main body for login with input fields and button
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 96.0),
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  child: Image(
                    image: AssetImage("images/m_logo.png"),
                    // width: 200.0,
                    // height: 200.0,
                  ),
                ),
                // TODO: First Input

                Container(
                  margin: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(0.0),
                      ),
                      new TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: new InputDecoration(
                          labelText: "Numbre de usuario",
                          fillColor: Colors.white,
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                          errorStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        validator: (input) {
                          if (input.length == 0) {
                            return "Entrar Numbre de usuario";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (input) => dni = input,
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
                //TODO:Second Input
                Container(
                  margin: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(0.0),
                      ),
                      new TextFormField(
                        cursorColor: Colors.white,
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: new InputDecoration(
                          labelText: "Contrasena",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                          errorStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        validator: (input) {
                          if (input.length == 0) {
                            return "Contrasena cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (input) => password = input,
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
                //TODO: Button

                Container(
                  margin: EdgeInsets.fromLTRB(24.0, 48.0, 24.0, 8.0),
                  child: MaterialButton(
                    onPressed: () {
                     print("emailnya $dni");
                     _navigeteToNextScreen(context);
                    },
                    child: Text(
                      "Entrar",
                      style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
                    ),
                    color: Colors.white,
                    splashColor: Colors.red,
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _navigeteToNextScreen(BuildContext context) {
    if (_key.currentState.validate()) {
      //saves to global key
      _key.currentState.save();
      signInMethod(dni, password);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ButtomNavigation(
                    dni: dni,
                    password: password,
                  )));
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }
}
