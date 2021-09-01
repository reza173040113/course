import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


String finalToken;

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  var loading = false;
  List<dynamic> data;
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
        "https://precampusgenerali.enzymeadvisinggroup.com/api2/api/v2/my-offerings/new?_limit=1000&_page=0",
        headers: headers);
    // print("haii"+jsonDecode(responseData.body));
    if (responseData.statusCode == 200) {
      Map<String, dynamic> map = json.decode(responseData.body);
      print(map);

      setState(() {
        data = map["content"];
        print("data news1 " + data[0]["title"]);
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
    //print("ha" + data[0]['title']);
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(
            //         margin: EdgeInsets.only(top: 30, left: 20),
            //         child: Text(
            //           "News",
            //           style:
            //               TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //         )),
            //     Container(
            //         margin: EdgeInsets.only(top: 30, right: 20),
            //         child: Row(
            //           children: [
            //             Container(
            //               margin: EdgeInsets.only(right: 30),
            //               child: Text("View",
            //                   style:
            //                       TextStyle(fontSize: 16, color: Colors.red)),
            //             ),
            //             Image.asset(
            //               "images/App_Assets/right-nav-active.png",
            //               width: 8,
            //               color: Colors.red,
            //             )
            //           ],
            //         ))
            //   ],
            // ),
            // FutureBuilder<List>(
            //   future: getData(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasError) print(snapshot.error);
            //     return snapshot.hasData
            //         ? ListNewsCard(list: snapshot.data)
            //         : Center(child: CircularProgressIndicator());
            //   },
            // ),
            Wrap(
              children: [
                // Container(
                //     height: 200,
                //     child: Card(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Expanded(
                //             child: Container(
                //               width: 250,
                //               // height: 100,
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 // image: DecorationImage(
                //                 //   image: NetworkImage("https://precampusgenerali.enzymeadvisinggroup.com/api2/api/v2/my-offerings/new?_limit=1000&_page=0"+data[0]['image']),
                //                 //   fit: BoxFit.fill,
                //                 //   alignment: Alignment.topCenter,
                //                 // ),
                //               ),
                //               child: Image.network("https://precampusgenerali.enzymeadvisinggroup.com/api2/api/v2/my-offerings/new?_limit=1000&_page=0"+data[0]['image']),
                //               // Text('Entry ${entries[index]}'),
                //             ),
                //           ),
                //           Container(
                //               margin: EdgeInsets.only(left: 10, top: 10),
                //               child: Text(
                //                 data[0]['title'],
                //                 style: TextStyle(fontWeight: FontWeight.bold),
                //               )),
                //           SizedBox(
                //             height: 20,
                //           ),
                //           Container(
                //               margin: EdgeInsets.only(left: 10, bottom: 10),
                //               child: Text(
                //                 data[0]['status'],
                //               )),
                //         ],
                //       ),
                //     )),
                // loading
                //     ? Center(child: CircularProgressIndicator())
                //     :
              ],
            )
          ],
        ),
      ),
    );
  }
}
