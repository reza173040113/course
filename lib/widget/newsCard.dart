import 'package:flutter/material.dart';

class CampaignCategories extends StatelessWidget {
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
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: 250,
                        // height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                        child: Text(
                      "Title",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        child: Text(
                      "Subtitle",
                    )),
                  ],
                ),
                
              );
            }));
  }
}

// Container(
              //   padding: EdgeInsets.all(8),
              //   margin: EdgeInsets.all(8),
              //   height: 50,
              //   color: Colors.teal,
              //   child: Center(child: Text('Entry ${entries[index]}')),
              // );