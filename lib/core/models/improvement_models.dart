import 'dart:convert';

List<ImprovementModel> improvementModelFromJson(String str) =>
    List<ImprovementModel>.from(
        json.decode(str).map((x) => ImprovementModel.fromJson(x)));

class ImprovementModel {
  ImprovementModel({
    this.content,
    this.characteristics,
    this.id,
    this.image,
    this.modality,
    this.rating,
    this.status,
    this.subtopic,
    this.title,
    this.topic,
    this.type,
    this.first,
    this.last,
    this.number,
    this.totalElements,
    this.totalPages,
    this.name,
  });
  String name;
  String characteristics;
  List<String> content;
  int id;
  String image;
  String modality;
  int rating;
  String status;
  String subtopic;
  String title;
  String topic;
  String type;
  bool first;
  bool last;
  int number;
  int totalElements;
  int totalPages;
  factory ImprovementModel.fromJson(Map<String, dynamic> json) =>
      ImprovementModel(
          content: Object.parse(
            characteristics: json["characteristics"],
            id: json["id"],
            image: json["image"],
            modality: json["modality"],
            rating: json["rating"],
          ),
          status: json["status"],
          subtopic: json["subtopic"],
          title: json["title"],
          topic: json["topic"],
          type: json["type"],
          first: json["first"],
          last: json["last"],
          name: json["name"],
          number: json["number"],
          totalElements: json["totalElements"],
          totalPages: json["totalPages"]);
}
