import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'LoginPage.dart';
import 'core/models/profile_models.dart';

String finalToken;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<dynamic> data;
  var loading = false;
  Map<String, dynamic> map;
  Future<Null> getData() async {
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
        "https://precampusgenerali.enzymeadvisinggroup.com/api2/api/v2/me/profile",
        headers: headers);
    // print("haii"+jsonDecode(responseData.body));
    if (responseData.statusCode == 200) {
      map = json.decode(responseData.body);
      print(map);

      setState(() {
        sharedPreferences.setInt("id", map['id']);
        // map = json.decode(responseData.body);
        // print(map);
        // data=map['name'];
        // map['surname'];
        // print("namaaa " + map['name'] + map['surname']);
        // data = map['aplications'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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
            body: Container(
              margin: EdgeInsets.fromLTRB(24.0, 100.0, 24.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8.0),
                    //TODO: Profile Picture's row
                    child: map != null
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  width: 72.0,
                                  height: 72.0,
                                  child: map['image'] != null
                                      ? Image.network(
                                          map['image'],
                                          fit: BoxFit.fill,
                                        )
                                      : Image.asset("images/profile.png",
                                          fit: BoxFit.fill)),
                              Container(
                                  margin: EdgeInsets.only(right: 24.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        map['name'],
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        map['surname'],
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )),
                              Container(
                                margin: EdgeInsets.only(left: 30.0),
                                child: Ink(
                                  decoration: const ShapeDecoration(
                                    shape: CircleBorder(),
                                    color: Colors.white,
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.card_membership),
                                    color: Colors.red,
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                              Container(
                                child: Ink(
                                  decoration: const ShapeDecoration(
                                    shape: CircleBorder(),
                                    color: Colors.white,
                                  ),
                                  child: IconButton(
                                    icon: const Icon(Icons.add),
                                    color: Colors.red,
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Center(child: CircularProgressIndicator()),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 4.0),
                    child: Text(
                      "Datos Acceso Gener@",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
                    child: Card(
                      elevation: 8.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.red.withAlpha(30),
                          onTap: () {
                            print("Card Tapped");
                          },
                          child: const SizedBox(
                            height: 100,
                            child: Text(
                              "A long string here...\nA long string here...",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 4,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
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
                    child: Card(
                      elevation: 8.0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                        child: InkWell(
                          splashColor: Colors.red.withAlpha(30),
                          onTap: () {
                            print("Card Tapped");
                          },
                          child: SizedBox(
                            child: Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Text.rich(
                                    TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.email,
                                            color: Colors.red,
                                          ),
                                        ),
                                        TextSpan(
                                            text:
                                                "map['email']!=null?map['email']:''"),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.blueGrey.withAlpha(30),
                                    thickness: 2.0,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.phone_android,
                                            color: Colors.red,
                                          ),
                                        ),
                                        TextSpan(
                                            text:
                                                "map['territorial']!=null?map['territorial']:''"),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.blueGrey.withAlpha(30),
                                    thickness: 2.0,
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.link,
                                            color: Colors.red,
                                          ),
                                        ),
                                        TextSpan(
                                            text:
                                                "map['territorial']!=null?map['territorial']:''"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0.0, 48.0, 0.0, 0.0),
                    margin: EdgeInsets.only(top: 72.0),
                    child: MaterialButton(
                      onPressed: () async {
                        final SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.remove('token');
                        Get.to(LoginPage());
                      },
                      child: Text(
                        "Logout",
                        style:
                            TextStyle(fontSize: 20.0, color: Colors.redAccent),
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
          )
        ],
      ),
    );
  }

  // Top Profile low, below AppBar
// Contains profile picture, Name, and two buttons
  // final profileRow = Row(
  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   children: <Widget>[
  //     Container(
  //       width: 72.0,
  //       height: 72.0,
  //       child: Image.asset(
  //         "images/profile.png",
  //         fit: BoxFit.fill,
  //       ),
  //     ),
  //     Container(
  //         margin: EdgeInsets.only(right: 24.0),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Text(
  //               map['name'],
  //               style: TextStyle(
  //                 fontSize: 20.0,
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.w800,
  //               ),
  //             ),
  //             Text(
  //               'name',
  //               style: TextStyle(
  //                 fontSize: 16.0,
  //                 color: Colors.white,
  //               ),
  //             ),
  //           ],
  //         )),
  //     Container(
  //       margin: EdgeInsets.only(left: 48.0),
  //       child: Ink(
  //         decoration: const ShapeDecoration(
  //           shape: CircleBorder(),
  //           color: Colors.white,
  //         ),
  //         child: IconButton(
  //           icon: const Icon(Icons.card_membership),
  //           color: Colors.red,
  //           onPressed: () {},
  //         ),
  //       ),
  //     ),
  //     Container(
  //       child: Ink(
  //         decoration: const ShapeDecoration(
  //           shape: CircleBorder(),
  //           color: Colors.white,
  //         ),
  //         child: IconButton(
  //           icon: const Icon(Icons.add),
  //           color: Colors.red,
  //           onPressed: () {},
  //         ),
  //       ),
  //     ),
  //   ],
  // );
}
