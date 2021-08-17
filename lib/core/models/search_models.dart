// To parse this JSON data, do
//
//     final modelSearch = modelSearchFromJson(jsonString);

import 'dart:convert';

ModelSearch modelSearchFromJson(String str) => ModelSearch.fromJson(json.decode(str));

String modelSearchToJson(ModelSearch data) => json.encode(data.toJson());

class ModelSearch {
    ModelSearch({
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

    factory ModelSearch.fromJson(Map<String, dynamic> json) => ModelSearch(
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
        this.courseid,
        this.description,
        this.dtcreation,
        this.editionid,
        this.idsubtopic,
        this.idtopic,
        this.image,
        this.itineraryId,
        this.modality,
        this.progress,
        this.rating,
        this.status,
        this.subtopic,
        this.supportid,
        this.title,
        this.topic,
        this.type,
        this.zone,
    });

    String characteristics;
    int courseid;
    String description;
    Dtcreation dtcreation;
    int editionid;
    int idsubtopic;
    int idtopic;
    String image;
    int itineraryId;
    String modality;
    int progress;
    int rating;
    String status;
    int subtopic;
    int supportid;
    String title;
    int topic;
    String type;
    String zone;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        characteristics: json["characteristics"],
        courseid: json["courseid"],
        description: json["description"],
        dtcreation: Dtcreation.fromJson(json["dtcreation"]),
        editionid: json["editionid"],
        idsubtopic: json["idsubtopic"],
        idtopic: json["idtopic"],
        image: json["image"],
        itineraryId: json["itineraryID"],
        modality: json["modality"],
        progress: json["progress"],
        rating: json["rating"],
        status: json["status"],
        subtopic: json["subtopic"],
        supportid: json["supportid"],
        title: json["title"],
        topic: json["topic"],
        type: json["type"],
        zone: json["zone"],
    );

    Map<String, dynamic> toJson() => {
        "characteristics": characteristics,
        "courseid": courseid,
        "description": description,
        "dtcreation": dtcreation.toJson(),
        "editionid": editionid,
        "idsubtopic": idsubtopic,
        "idtopic": idtopic,
        "image": image,
        "itineraryID": itineraryId,
        "modality": modality,
        "progress": progress,
        "rating": rating,
        "status": status,
        "subtopic": subtopic,
        "supportid": supportid,
        "title": title,
        "topic": topic,
        "type": type,
        "zone": zone,
    };
}

class Dtcreation {
    Dtcreation({
        this.date,
        this.day,
        this.hours,
        this.minutes,
        this.month,
        this.nanos,
        this.seconds,
        this.time,
        this.timezoneOffset,
        this.year,
    });

    int date;
    int day;
    int hours;
    int minutes;
    int month;
    int nanos;
    int seconds;
    int time;
    int timezoneOffset;
    int year;

    factory Dtcreation.fromJson(Map<String, dynamic> json) => Dtcreation(
        date: json["date"],
        day: json["day"],
        hours: json["hours"],
        minutes: json["minutes"],
        month: json["month"],
        nanos: json["nanos"],
        seconds: json["seconds"],
        time: json["time"],
        timezoneOffset: json["timezoneOffset"],
        year: json["year"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "day": day,
        "hours": hours,
        "minutes": minutes,
        "month": month,
        "nanos": nanos,
        "seconds": seconds,
        "time": time,
        "timezoneOffset": timezoneOffset,
        "year": year,
    };
}
