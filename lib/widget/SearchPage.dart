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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 70, left: 10, right: 10),
      child: FloatingSearchBar(
        padding: EdgeInsets.only(left: 10),
        hint: 'Search.....',
        borderRadius: BorderRadius.circular(20),
        openAxisAlignment: 0.0,
        maxWidth: 500,
        axisAlignment: 0.0,
        // scrollPadding: EdgeInsets.only(top: 16, bottom: 20),
        elevation: 4.0,
        physics: BouncingScrollPhysics(),
        onQueryChanged: (query) {
          //Your methods will be here
        },
        showDrawerHamburger: false,
        transitionCurve: Curves.easeInOut,
        transitionDuration: Duration(milliseconds: 500),
        transition: CircularFloatingSearchBarTransition(),
        debounceDelay: Duration(milliseconds: 500),
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
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
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
                    Text("Area",style:TextStyle(color: Colors.red)),
                    map != null
                        ? DropdownButton<String>(
                            isExpanded: true,
                            items: map.map<DropdownMenuItem<String>>((value) =>
                                new DropdownMenuItem<String>(
                                    value: value["Area"],
                                    child: new Text(value["Area"]))).toList(),
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
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Api Filter list Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  // ExamplePage({ Key key }) : super(key: key);
  @override
  _ExamplePageState createState() => new _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  // final formKey = new GlobalKey<FormState>();
  // final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List names = new List();
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search Example');

  _ExamplePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    // this._getNames();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
    );
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['name']
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return ListView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: Text(filteredNames[index]['name']),
          onTap: () => print(filteredNames[index]['name']),
        );
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  // void _getNames() async {
  //   final response = await dio.get('https://swapi.co/api/people');
  //   List tempList = new List();
  //   for (int i = 0; i < response.data['results'].length; i++) {
  //     tempList.add(response.data['results'][i]);
  //   }
  //   setState(() {
  //     names = tempList;
  //     names.shuffle();
  //     filteredNames = names;
  //   });
  // }
}
