import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:generali/core/models/news_model.dart';
import 'package:generali/widget/newsCard.dart';
import 'package:http/http.dart' as http;

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<ModelNews> listModel = [];
  var loading = false;
  Future<Null> getData() async {
    setState(() {
      loading = true;
    });
    final responseData = await http.get(
        "https://precampusgenerali.enzymeadvisinggroup.com/api2/api/v2/my-offerings/new");
    if (responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body);
      setState(() {
        for (Map i in data) {
          listModel.add(ModelNews.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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
            Wrap(
              children: [
                loading
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        height: 200,
                        child: Container(
                            height: 120.0,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.all(8),
                                itemCount: listModel.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final nDataList = listModel[index];

                                  return Card(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children:
                                            nDataList.content.map((content) {
                                          return Column(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 250,
                                                  // height: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                          "https://cdn.wallpaperhub.app/cloudcache/1/b/5/8/e/f/1b58ef6e3d36a42e01992accf5c52d6eea244353.jpg"),
                                                      fit: BoxFit.fill,
                                                      alignment:
                                                          Alignment.topCenter,
                                                    ),
                                                  ),
                                                  // Text('Entry ${entries[index]}'),
                                                ),
                                              ),
                                              Container(
                                                  child: Text(
                                                content.title,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                  child: Text(
                                                content.status,
                                              )),
                                            ],
                                          );
                                        }).toList()),
                                  );
                                }))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
