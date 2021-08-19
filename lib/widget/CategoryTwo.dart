import 'package:flutter/material.dart';
import 'package:generali/Volver.dart';

class CategoryTwo extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Volver()));
                },
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: 200,
                          // height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://cdn.wallpaperhub.app/cloudcache/1/b/5/8/e/f/1b58ef6e3d36a42e01992accf5c52d6eea244353.jpg"),
                              fit: BoxFit.fill,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          // Text('Entry ${entries[index]}'),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20, left: 10),
                          child: Text("Title",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 2)),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "No Solicitado",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10, right: 30),
                            padding: EdgeInsets.only(
                                left: 5, right: 5, top: 2, bottom: 2),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    padding: EdgeInsets.only(
                                      right: 10,
                                    ),
                                    child: Text(
                                      "Online",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ],
                            ),
                          ),
                          for (int i = 0; i < 5; i++)
                            Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Icon(Icons.star,
                                    size: 14, color: Colors.yellow))
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
