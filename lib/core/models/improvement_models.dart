// To parse this JSON data, do
//
//     final modelImprovement = modelImprovementFromJson(jsonString);

import 'dart:convert';

ModelImprovement modelImprovementFromJson(String str) => ModelImprovement.fromJson(json.decode(str));

String modelImprovementToJson(ModelImprovement data) => json.encode(data.toJson());

class ModelImprovement {
    ModelImprovement({
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

    factory ModelImprovement.fromJson(Map<String, dynamic> json) => ModelImprovement(
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
        this.subtopic,
        this.title,
        this.topic,
        this.type,
    });

    String characteristics;
    int id;
    String image;
    String modality;
    int rating;
    String status;
    String subtopic;
    String title;
    String topic;
    String type;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        characteristics: json["characteristics"],
        id: json["id"],
        image: json["image"],
        modality: json["modality"],
        rating: json["rating"],
        status: json["status"],
        subtopic: json["subtopic"],
        title: json["title"],
        topic: json["topic"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "characteristics": characteristics,
        "id": id,
        "image": image,
        "modality": modality,
        "rating": rating,
        "status": status,
        "subtopic": subtopic,
        "title": title,
        "topic": topic,
        "type": type,
    };
}
