// To parse this JSON data, do
//
//     final modelOffering = modelOfferingFromJson(jsonString);

import 'dart:convert';

ModelOffering modelOfferingFromJson(String str) => ModelOffering.fromJson(json.decode(str));

String modelOfferingToJson(ModelOffering data) => json.encode(data.toJson());

class ModelOffering {
    ModelOffering({
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

    factory ModelOffering.fromJson(Map<String, dynamic> json) => ModelOffering(
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

    Map<String, dynamic> toJson() => {
        "creationDate": creationDate,
        "description": description,
        "duration": duration,
        "id": id,
        "image": image,
        "rating": rating,
        "title": title,
        "type": type,
        "url": url,
        "viewed": viewed,
        "vieweddate": vieweddate,
        "views": views,
        "vote": vote,
    };
}
