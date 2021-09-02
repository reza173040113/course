import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  // const SearchWidget({ Key? key }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(
      //   top: 4,
      // ),
      margin: EdgeInsets.only(
        left: 14,
        right: 14,
      ),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              // margin: EdgeInsets.all(10),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                      color: Colors.grey[400], fontWeight: FontWeight.bold),
                  border: InputBorder.none,
                ),
                onChanged: (String keyword) {},
              ),
            ),
          ),
          Container(
            // margin: EdgeInsets.all(8),
            height: 50,
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.red[900],
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
