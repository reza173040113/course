import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.only(top: 30, left: 20),
                child: Text(
                  "News",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Container(
                margin: EdgeInsets.only(top: 30, right: 20),
                child: Text("View >",
                    style: TextStyle(fontSize: 16, color: Colors.red)))
          ],
        ),
        
      ],
    );
  }
}
