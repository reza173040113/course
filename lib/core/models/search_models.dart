import 'dart:convert';

import 'dart:ffi';

List<SearchModel> searchModelFromJson(String str) => List<SearchModel>.from(json.decode(str).map((x) => SearchModel.fromJson(x)));

class SearchModel {
  SearchModel({
  bool first, last, content, number, totalElements, totalPages;
  String content;    
  String idArea;
  String area;
  String num_Users;
  String idsubtopic;
  String subTopic;
  String areaImg;
  String first;
  String last;
  String number;
  String totalElements;
  String totalPages;
  String characteristics;
  String courseid;
  String description;
  String globalsituation;
  String date;
  String day;
  String hours;
  String minutes;
  String month;
  String nanos;
  String seconds;
  String time;
  String timezoneOffset;
  String year;
  String editionid;
  String idsubtopic;
  String idtopic;
  String image;
  String itineraryID;
  String modality;
  String progress;
  String rating;
  String status;
  String subtopic;
  String supportid;
  String title;
  String topic;
  String type;
  String zone;
  
  this.content, [
    this.idArea,
    this.area,
    this.num_Users,
    this.idsubtopic,
    this.subTopic,
    this.areaImg,
    this.characteristics,
    this.courseid,
    this.description,
    this.dtcreation, [
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
    ],
    this.editionid,
    this.idsubtopic,
    this.idtopic,
    this.image,
    this.itineraryID,
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
  ],
    this.first,
    this.last,
    this.number,
    this.totalElements,
    this.totalPages,
  });


  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
      content: Object.parse(
        idArea: json["idArea"],
        area: json["area"],
        num_Users: json["num_Users"],
        idsubtopic: json["idsubtopic"],
        subTopic: json["subTopic"],
        areaImg: json["areaImg"],
        characteristics: json["characteristics"],
        courseid: json["courseid"],
        description: json["description"],
        dtcreation: Array.parse(
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
        ),
        editionid: json["editionid"],
        idsubtopic: json["idsubtopic"],
        idtopic: json["idtopic"],
        image: json["image"],
        itineraryID: json["itineraryID"],
        modality: json["modality"],
        progress: json["progress"],
        rating: json["rating"],
        status: json["status"],
        subtopic: json["subtopic"],
        supportid: json["supportid"],
        title: json["title"],
        topic: json["topic"],
        type: json["type"],
        zone: json["zone"]
      ),   
        first: json["first"],
        last: json["first"],
        number: json["number"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
      );
}
