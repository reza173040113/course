import 'package:flutter/material.dart';

class ListNewsCard extends StatelessWidget {
  final List list;
  ListNewsCard({this.list});
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120.0,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return NewsCard(
                  image:
                      "https://cdn.wallpaperhub.app/cloudcache/1/b/5/8/e/f/1b58ef6e3d36a42e01992accf5c52d6eea244353.jpg",
                  title: list[index]['title'],
                  subtitle: "Subtitle");
            }));
  }
}

class NewsCard extends StatefulWidget {
  final String image, title, subtitle;
  const NewsCard({Key key, this.image, this.title, this.subtitle})
      : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: 250,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(widget.image),
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter,
                ),
              ),
              // Text('Entry ${entries[index]}'),
            ),
          ),
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
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.only(left: 10, bottom: 10),
              child: Text(
                widget.subtitle,
              )),
        ],
      ),
    );
  }
}
