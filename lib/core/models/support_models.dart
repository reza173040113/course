import 'dart:convert';

List<SupportModel> supportModelFromJson(String str) =>
    List<SupportModel>.from(
        json.decode(str).map((x) => SupportModel.fromJson(x)));

class SupportModel {
  SupportModel({
    this.creationDate,
    this.description,
    this.duration,
    this.id,
    this.image,
    this.rating,
    this.title,
    this.type,
    this.url,
    this.viewed,
    this.vieweddate,
    this.views,
    this.vote,
  });
  String creationDate;
  String description;
  String duration;
  int id;
  String image;
  int rating;
  String title;
  String type;
  String url;
  String viewed;
  String vieweddate;
  int views;
  String vote;
  factory SupportModel.fromJson(Map<String, dynamic> json) =>
      SupportModel(
          creationDate: json["creationDate"],
          description: json["description"],
          duration: json["duration"],
          id: json["id"],
          image: json["image"],
          rating: json["rating"],
          title: json["title"],
          type: json["type"],
          url: json["url"],
          viewed: json["viewed"],
          vieweddate: json["vieweddate"],
          views: json["views"],
          vote: json["vote"],
);
}
