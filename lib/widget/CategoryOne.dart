import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:generali/Volver.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

String finalToken;

class CategoryOne extends StatefulWidget {
  @override
  State<CategoryOne> createState() => _CategoryOneState();
}

class _CategoryOneState extends State<CategoryOne> {
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G'];

  final List<int> colorCodes = <int>[600, 500, 100];
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
        "https://precampusgenerali.enzymeadvisinggroup.com/api2/api/v2/my-offerings/new?_limit=1000&_page=0",
        headers: headers);

    if (responseData.statusCode == 200) {
      map = json.decode(responseData.body);
      print(map);
      if (this.mounted) {
        setState(() {
          data = map["content"];
          print("data news1 " + data[0]["title"]);
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
    return Container(
        height: 120.0,
        child: data != null
            ? ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (data[index]['type'] == 'support') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Volver(
                                      id: data[index]['id'],
                                    )));
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Data not available'),
                               
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 220,
                            height: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.wallpaperhub.app/cloudcache/1/b/5/8/e/f/1b58ef6e3d36a42e01992accf5c52d6eea244353.jpg"),
                                fit: BoxFit.fill,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            // Text('Entry ${entries[index]}'),
                          ),
                          Container(
                              // margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(8),
                              width: 220,
                              child: Text(
                                data[index]['title'] != null
                                    ? data[index]['title']
                                    : '',
                                maxLines: 2,
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .caption
                                    .copyWith(color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                              )),
                          Container(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: HexColor("#c5281c"),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.notifications,
                                  color: Colors.white,
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      data[index]['status'],
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10, right: 30),
                                padding: EdgeInsets.only(
                                    left: 5, right: 5, top: 2, bottom: 2),
                                decoration: BoxDecoration(
                                    color: HexColor("#c5281c"),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(left: 10),
                                        padding: EdgeInsets.only(
                                          right: 10,
                                        ),
                                        child: Text(
                                          data[index]['modality'] != null
                                              ? data[index]['modality']
                                              : '',
                                          style: TextStyle(color: Colors.white),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10, left: 20),
                                child: SmoothStarRating(
                                  isReadOnly: true,
                                  size: 14,
                                  rating: data[index]['rating'].toDouble(),
                                  borderColor: Colors.yellow,
                                  color: Colors.yellow,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}
