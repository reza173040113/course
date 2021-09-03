import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:generali/widget/SearchCardOrder.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'SearchCard.dart';

String finalToken;
class SearchDetailType extends StatefulWidget {
  final String type;
  SearchDetailType({@required this.type});

  @override
  _SearchDetailTypeState createState() => _SearchDetailTypeState();
}

class _SearchDetailTypeState extends State<SearchDetailType> {
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
        "https://precampusgenerali.enzymeadvisinggroup.com/api2/api/v2/search?_limit=1000&_page=0&type='${widget.type}'",
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
    return Scaffold(
      body: data!=null?Container(
          height: 800,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(8),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchCard(
                  image:
                      "https://cdn.wallpaperhub.app/cloudcache/1/b/5/8/e/f/1b58ef6e3d36a42e01992accf5c52d6eea244353.jpg",
                  title: data[index]['title'],
                  subtitle: data[index]['status'],
                  rating: data[index]['rating'],
                );
              })):Center(child: CircularProgressIndicator()),
    );
  }
}
