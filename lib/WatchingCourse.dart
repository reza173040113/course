import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:generali/widget/watchingCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalToken;

class WatchingCourse extends StatefulWidget {
  @override
  _WatchingCourseState createState() => _WatchingCourseState();
}

class _WatchingCourseState extends State<WatchingCourse> {
  var loading = false;
  List<dynamic> data;
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
        "https://precampusgenerali.enzymeadvisinggroup.com/api2/api/v2/my-offerings?_limit=1000&_page=0&type=course",
        headers: headers);

    if (responseData.statusCode == 200) {
      map = json.decode(responseData.body);
      print(map);
      if (this.mounted) {
        setState(() {
          data = map["content"];
          print("offering " + data[0]["title"]);
          print(data.length);
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
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 30, left: 20),
                    child: Text(
                      "Watching Courses",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 30, right: 20),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Text("View",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.red)),
                        ),
                        Image.asset(
                          "images/App_Assets/right-nav-active.png",
                          width: 8,
                          color: Colors.red,
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                data != null
                    ? Container(
                        height: 90,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.all(8),
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return WatchingCard(
                                image:
                                    "https://cdn.wallpaperhub.app/cloudcache/1/b/5/8/e/f/1b58ef6e3d36a42e01992accf5c52d6eea244353.jpg",
                                title: data[index]['title'],
                                subtitle: data[index]['subtopic'],
                              );
                            }))
                    : Center(child: CircularProgressIndicator()),
                // Text("h")
              ],
            )
          ],
        ),
      ),
    );
  }
}
