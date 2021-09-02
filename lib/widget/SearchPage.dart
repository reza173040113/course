import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String finalToken;

class SearchPage extends StatefulWidget {
  // const SearchPage({ Key? key }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var loading = false;
  List<dynamic> map;
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
        "https://precampusgenerali.enzymeadvisinggroup.com/api2/api/v2/search/areas",
        headers: headers);

    if (responseData.statusCode == 200) {
      map = json.decode(responseData.body);

      print(map[0]['Area']);
      setState(() {
        // data = map["content"];
        // print("search " + data[0]["title"]);
        // print(data.length);
      });
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
    String value = "";
    List<String> list = [
      'Baik Sekali',
      'Baik',
      'Kurang Baik',
      'Kurang Baik Sekali'
    ];
    return Stack(children: [
      Positioned(
        top: 70,
        child: FloatingSearchBar(
          hint: 'Search...',
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          padding: EdgeInsets.only(left: 10),
          transitionDuration: const Duration(milliseconds: 800),
          borderRadius: BorderRadius.circular(20),
          transitionCurve: Curves.easeInOut,
          backdropColor: Colors.transparent,
          physics: const BouncingScrollPhysics(),
          maxWidth: 500,
          openAxisAlignment: 0.0,
          //     maxWidth: 500,
          //     axisAlignment: 0.0,
          debounceDelay: const Duration(milliseconds: 500),
          onQueryChanged: (query) {
            // Call your model, bloc, controller here.
          },
          // Specify a custom transition to be used for
          // animating between opened and closed stated.
          transition: CircularFloatingSearchBarTransition(),
          actions: [
            FloatingSearchBarAction(
              showIfOpened: false,
              child: Container(
                width: 50,
                child: RaisedButton(
                  padding: EdgeInsets.only(right: 2, left: 4),
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    print('Places Pressed');
                  },
                ),
              ),
            ),
            FloatingSearchBarAction.searchToClear(
              showIfClosed: false,
            ),
          ],
          builder: (context, transition) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Material(
                color: Colors.white,
                child: Container(
                  margin: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.9,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text("Status"),
                      // DropdownButton<String>(
                      //   isExpanded: true,
                      //   items: list
                      //       .map((listTitle) => DropdownMenuItem(
                      //           value: listTitle, child: Text("$listTitle")))
                      //       .toList(),
                      //   onChanged: (_value) => {
                      //     print(_value.toString()),
                      //     setState(() {
                      //       value = _value;
                      //     }),
                      //   },
                      //   hint: Text("Pilih"),
                      // ),
                      Text("Area", style: TextStyle(color: Colors.red)),
                      map != null
                          ? DropdownButton<String>(
                              isExpanded: true,
                              items: map
                                  .map<DropdownMenuItem<String>>((value) =>
                                      new DropdownMenuItem<String>(
                                          value: value["Area"],
                                          child: new Text(value["Area"])))
                                  .toList(),
                              onChanged: (_value) => {
                                print(_value.toString()),
                                setState(() {
                                  value = _value;
                                }),
                              },
                              hint: Text("Selleciona"),
                            )
                          : Center(child: CircularProgressIndicator()),
                      // Text("Kesatu"),
                      // DropdownButton<String>(
                      //   isExpanded: true,
                      //   items: list
                      //       .map((listTitle) => DropdownMenuItem(
                      //           value: listTitle, child: Text("$listTitle")))
                      //       .toList(),
                      //   onChanged: (_value) => {
                      //     print(_value.toString()),
                      //     setState(() {
                      //       value = _value;
                      //     }),
                      //   },
                      //   hint: Text("Pilih"),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ]);
  }
}
