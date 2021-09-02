//

import 'package:flutter/material.dart';

class SerachWidget extends StatefulWidget {
  // const SerachWidget({ Key? key }) : super(key: key);

  @override
  _SerachWidgetState createState() => _SerachWidgetState();
}

class _SerachWidgetState extends State<SerachWidget> {
  @override
  Widget build(BuildContext context) {
    String value = "";
    List<String> list = [
      'Baik Sekali',
      'Baik',
      'Kurang Baik',
      'Kurang Baik Sekali'
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text("Search"),
        ),
        body: ClipRRect(
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
                  Text("Status"),
                  DropdownButton<String>(
                    isExpanded: true,
                    items: list
                        .map((listTitle) => DropdownMenuItem(
                            value: listTitle, child: Text("$listTitle")))
                        .toList(),
                    onChanged: (_value) => {
                      print(_value.toString()),
                      setState(() {
                        value = _value;
                      }),
                    },
                    hint: Text("Pilih"),
                  ),
                  Text("Area"),
                  DropdownButton<String>(
                    isExpanded: true,
                    items: list
                        .map((listTitle) => DropdownMenuItem(
                            value: listTitle, child: Text("$listTitle")))
                        .toList(),
                    onChanged: (_value) => {
                      print(_value.toString()),
                      setState(() {
                        value = _value;
                      }),
                    },
                    hint: Text("Pilih"),
                  ),
                  Text("Kesatu"),
                  DropdownButton<String>(
                    isExpanded: true,
                    items: list
                        .map((listTitle) => DropdownMenuItem(
                            value: listTitle, child: Text("$listTitle")))
                        .toList(),
                    onChanged: (_value) => {
                      print(_value.toString()),
                      setState(() {
                        value = _value;
                      }),
                    },
                    hint: Text("Pilih"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
