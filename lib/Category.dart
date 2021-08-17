import 'package:flutter/material.dart';
import 'package:generali/widget/CategoryOne.dart';
import 'package:generali/widget/CategoryTwo.dart';
import 'package:generali/widget/newsCard.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(top:10,left: 10,),
                child: Text(
                  "Courses Category One",
                  style: TextStyle(color: Colors.white, fontSize: 26),
                )),
            Wrap(
              children: [
                Container(height: 250, child: CategoryOne()),
              ],
            ),
            Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  "Courses Category Two",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                )),
            Wrap(
              children: [
                Container(height: 250, child: CategoryTwo()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
