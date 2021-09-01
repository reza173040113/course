import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class WatchingCard extends StatefulWidget {
  final String image, title, subtitle;

  const WatchingCard({Key key, this.image, this.title, this.subtitle})
      : super(key: key);
  @override
  _WatchingCardState createState() => _WatchingCardState();
}

class _WatchingCardState extends State<WatchingCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 9),
            blurRadius: 24,
            color: Color(0xFFB7B7B7).withOpacity(.50),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            // constraints: BoxConstraints(
            //     minHeight: 79, minWidth: 92, maxHeight: 120, maxWidth: 100),
            width: 92,
            height: 92,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(widget.image),
                fit: BoxFit.fill,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Container(
              // constraints: BoxConstraints(
              //     maxHeight: 100, maxWidth: 120, minHeight: 79, minWidth: 92),
              width: 250,
              height: 90,
              margin: EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 9,
                      ),
                      Expanded(
                        child: Wrap(
                          children: [
                            // Flexible(
                            //   child: Text(
                            //     widget.title,
                            //     maxLines: 1,
                            //     softWrap: false,
                            //     overflow: TextOverflow.ellipsis,
                            //   ),
                            // ),
                            Container(
                                width: 250,
                                child: Text(
                                  widget.title,
                                  maxLines: 2,
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .caption
                                      .copyWith(color: Colors.black),
                                  overflow: TextOverflow.ellipsis,
                                )),
                            // Container(
                            //   child: Text(
                            //     widget.title,
                            //     // maxLines: 2,
                            //     softWrap: false,
                            //     overflow: TextOverflow.fade,
                            //     style: TextStyle(fontWeight: FontWeight.bold),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 3),
                          child: Text(widget.subtitle,
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey))),
                    ],
                  ),
                  Container(
                    child: LinearPercentIndicator(
                      width: 200.0,
                      lineHeight: 5.0,
                      percent: 0.1,
                      progressColor: Colors.red,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 3),
                          child: Text("10%",
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey))),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class ListWatchCard extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Container(
        // height: MediaQuery.of(context).size.height,
        // height: 500,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return WatchingCard(
                image:
                    "https://awsimages.detik.net.id/community/media/visual/2021/06/17/wallpaper-windows-11-1.jpeg?w=750&q=90",
                title: "title",
                subtitle: "subtitle",
              );
            }));
  }
}
