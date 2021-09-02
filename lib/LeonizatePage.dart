import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:generali/LeonizateScroll.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LeonizatePage extends StatefulWidget {
  @override
  _LeonizatePageState createState() => _LeonizatePageState();
}

class _LeonizatePageState extends State<LeonizatePage> {
  int _currentIndex = 0;
  List cardList = [
    Item1(),
    Item2(),
    Item3(),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      margin: EdgeInsets.only(top: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: false,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
              items: cardList.map((card) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                      height: MediaQuery.of(context).size.height * 0.85,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: card);
                });
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(cardList, (index, url) {
                return Container(
                  width: _currentIndex == index ? 30 : 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: _currentIndex == index
                        ? HexColor("#c5281c")
                        : HexColor("#c5281c").withOpacity(0.3),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.2, right: 30),
                  child: Text("Liga Leonizate",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        color: HexColor("#c5281c"), shape: BoxShape.circle),
                    child: Text("?",
                        style: TextStyle(color: Colors.white, fontSize: 20))),
                Container(
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        color: HexColor("#c5281c"), shape: BoxShape.circle),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LeozinateScroll()));
                        },
                        child: Text("+",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)))),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(top: 60, left: 20, right: 15),
                    child: Image.asset(
                      "images/App_Assets/medal-silver.png",
                      width: 30,
                    )),
                Container(
                    margin: EdgeInsets.only(top: 40, right: 15),
                    child: Image.asset(
                      "images/App_Assets/medal-silver.png",
                      width: 50,
                    )),
                Container(
                    margin: EdgeInsets.only(top: 20, right: 15),
                    child: Image.asset(
                      "images/App_Assets/medal-silver.png",
                      width: 70,
                    )),
                Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Image.asset(
                      "images/App_Assets/medal-master.png",
                      width: 90,
                    )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8, left: 5),
            child: LinearPercentIndicator(
              width: MediaQuery.of(context).size.width * 0.85,
              lineHeight: 5.0,
              percent: 0,
              backgroundColor: Colors.black,
              progressColor: Colors.yellow,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 70,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              "0",
              style: TextStyle(color: HexColor("#c5281c")),
            )),
          )
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text("Formacion continua",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20, right: 10, top: 10),
                    child: Image.asset(
                      "images/App_Assets/medal_oro.png",
                      width: 90,
                    )),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Text("0 / 25",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold)),
                      Text("ANO ACTUAL",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Text("Estado de la formation",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600)),
                ),
                Container(
                    margin: EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        color: HexColor("#c5281c"), shape: BoxShape.circle),
                    child: Text("?",
                        style: TextStyle(color: Colors.white, fontSize: 20))),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 70.0,
                      lineWidth: 9.0,
                      percent: 1.0,
                      center: new Text("0%"),
                      progressColor: Colors.grey[200],
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("Intinerarios",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14)))
                  ],
                ),
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 70.0,
                      lineWidth: 9.0,
                      percent: 1.0,
                      center: new Text("0%"),
                      progressColor: Colors.grey[200],
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("Estrategica",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14)))
                  ],
                ),
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 70.0,
                      lineWidth: 9.0,
                      percent: 1.0,
                      center: new Text("0%"),
                      progressColor: Colors.grey[200],
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text("Obligatoria",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14)))
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String title;

  const ItemCard({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 2),
        ],
      ),
      child: Center(
        child: Text(title),
      ),
    );
  }
}
