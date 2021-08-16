import 'dart:convert';

List<OfferingModel> offeringModelFromJson(String str) => List<OfferingModel>.from(json.decode(str).map((x) => OfferingModel.fromJson(x)));

class OfferingModel {
  OfferingModel({
    this.first, last, number, totalElements, totalPages,
    this.content [
      this.characteristics,
      this.id,
      this.image,
      this.modality,
      this.rating,
      this.status,
      this.title,
      this.type,
    ],
  });

  List<String> content;
  String characteristics;
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

  factory OfferingModel.fromJson(Map<String, dynamic> json) => OfferingModel(
        content: Object.parse(
        characteristics: json["characteristics"],
        id: json["id"],
        image: json["image"],
        modality: json["modality"],
        rating: json["rating"],
        status: json["status"],
        title: json["title"],
        type: json["type"],
      ),
        first: json["first"],
        last: json["last"],
        number: json["number"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
      );
}
