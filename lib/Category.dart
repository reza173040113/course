import 'package:flutter/material.dart';
import 'package:generali/widget/CategoryOne.dart';
import 'package:generali/widget/CategoryThree.dart';
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
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
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
            Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  "Courses Category Three",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                )),
            Wrap(
              children: [
                Container(height: 250, child: CategoryThree()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
