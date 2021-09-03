import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SearchCard extends StatefulWidget {
  final String image, title, subtitle;
  final double rating;

  const SearchCard(
      {Key key, this.image, this.title, this.subtitle, this.rating})
      : super(key: key);
  @override
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                      
                    ],
                  )),
            ],
          ),
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                margin: EdgeInsets.only(bottom: 10, top: 10, left: 10),
                decoration: BoxDecoration(
                    color: HexColor("#c5281c"),
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
                          widget.subtitle,
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
              Container(
                margin:EdgeInsets.only(right: 10),
                child: SmoothStarRating(
                  isReadOnly: true,
                  size: 14,
                  rating:widget.rating,
                  borderColor: Colors.yellow,
                  color: Colors.yellow,
                ),
              )
            ],
          )
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
              return SearchCard(
                image:
                    "https://awsimages.detik.net.id/community/media/visual/2021/06/17/wallpaper-windows-11-1.jpeg?w=750&q=90",
                title: "title",
                subtitle: "subtitle",
                
              );
            }));
  }
}
