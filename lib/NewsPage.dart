import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
                      "News",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 30, right: 20),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right:30),
                          child: Text("View",
                              style: TextStyle(fontSize: 16, color: Colors.red)),
                        ),
                            Image.asset("images/App_Assets/right-nav-active.png", width: 8,color: Colors.red,)
                      ],
                    ))
              ],
            ),
            // Expanded(
            //   child: SizedBox(
            //       height: 10,
            //       child: ListView(
            //         shrinkWrap: true,
            //         scrollDirection: Axis.horizontal,
            //         children: [
            //           Container(
            //               margin: EdgeInsets.only(left: 10),
            //               height: 150,
            //               width: 250,
            //               decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(25),
            //                   color: Colors.redAccent),
            //               child: Text("hai")),
            //           Container(
            //               margin: EdgeInsets.only(left: 10),
            //               height: 150,
            //               width: 250,
            //               decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(25),
            //                   color: Colors.redAccent),
            //               child: Text("hai"))
            //         ],
            //       )),
            // ),
           
            
          ],
        ),
      ),
    );
  }
}
