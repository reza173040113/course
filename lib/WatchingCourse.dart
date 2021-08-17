import 'package:flutter/material.dart';
import 'package:generali/widget/watchingCard.dart';

class WatchingCourse extends StatefulWidget {
  @override
  _WatchingCourseState createState() => _WatchingCourseState();
}

class _WatchingCourseState extends State<WatchingCourse> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 30, left: 20),
                    child: Text(
                      "Watching Courses",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 30, right: 20),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Text("View",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.red)),
                        ),
                        Image.asset(
                          "images/App_Assets/right-nav-active.png",
                          width: 8,
                          color: Colors.red,
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                Container(height: 500, child: ListWatchCard()),
              ],
            )
          ],
        ),
      ),
    );
  }
}
