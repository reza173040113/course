// To parse this JSON data, do
//
//     final modelRegenerate = modelRegenerateFromJson(jsonString);

import 'dart:convert';

ModelRegenerate modelRegenerateFromJson(String str) => ModelRegenerate.fromJson(json.decode(str));

String modelRegenerateToJson(ModelRegenerate data) => json.encode(data.toJson());

class ModelRegenerate {
    ModelRegenerate({
        this.content,
        this.first,
        this.last,
        this.number,
        this.totalElements,
        this.totalPages,
    });

    List<Content> content;
    bool first;
    bool last;
    int number;
    int totalElements;
    int totalPages;

    factory ModelRegenerate.fromJson(Map<String, dynamic> json) => ModelRegenerate(
        content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        first: json["first"],
        last: json["last"],
        number: json["number"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
    );

    Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "first": first,
        "last": last,
        "number": number,
        "totalElements": totalElements,
        "totalPages": totalPages,
    };
}

class Content {
    Content({
        this.characteristics,
        this.id,
        this.image,
        this.modality,
        this.rating,
        this.status,
        this.title,
        this.type,
    });

    String characteristics;
    int id;
    String image;
    String modality;
    int rating;
    String status;
    String title;
    String type;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        characteristics: json["characteristics"],
        id: json["id"],
        image: json["image"],
        modality: json["modality"],
        rating: json["rating"],
        status: json["status"],
        title: json["title"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "characteristics": characteristics,
        "id": id,
        "image": image,
        "modality": modality,
        "rating": rating,
        "status": status,
        "title": title,
        "type": type,
    };
}
