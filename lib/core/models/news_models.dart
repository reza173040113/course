import 'dart:convert';

import 'package:generali/core/models/improvement_models.dart';

List<NewsModel> newsModelFromJson(String str) => List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

class NewsModel {
  NewsModel({
    this.characteristics,
    this.id,
    this.image,
    this.modality,
    this.rating,
    this.status,
    this.title,
    this.type,
    this.first,
    this.last,
    this.number,
    this.totalElements,
    this.totalPages, content,
  });

  String characteristics;
  List<String> content;
  int id;
  String image;
  String modality;
  int rating;
  String status;
  String title;
  String type;
  bool first;
  bool last;
  int number;
  int totalElements;
  int totalPages;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        content: Object.parse(
          characteristics: json["characteristics"],
          id: json["id"],
          image: json["image"],
          modality: json["modality"],
          rating: json["rating"],
          status: json["status"],
          title: json["title"],
          type: json["type"]
        ), 
        first: json["first"],
        last: json["last"],
        number: json["number"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"]
      );
}

