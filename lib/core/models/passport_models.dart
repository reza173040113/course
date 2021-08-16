import 'dart:convert';

import 'dart:core';
List<PassportModel> passportModelFromJson(String str) => List<PassportModel>.from(json.decode(str).map((x) => PassportModel.fromJson(x)));

class PassportModel {
  PassportModel({
  List<String> courseDetail;
  String duration;
  String idArea;
  String modality;
  String showRealTime;
  String status;
  String title;
  List<String> globalsituation;
  String end_date;
  String finished;
  String first_date;
  String last_visit;
  String pending;
  String score;
  String total_time;
  String type;
  List<String> itineraryDetail;
  String description;
  String filepath;
  String progress;
  String title;
  List<String> user;
  String firstname;
  String lastname;
  String pathimage;
  List<String> trainingHours;
  String hours;
  String status;
  String year;
    this.courseDetail[
      this.duration,
      this.idArea,
      this.modality,
      this.showRealTime,
      this.status,
      this.title,
    ],
    this.globalsituation, [
      this.end_date,
      this.finished,
      this.first_date,
      this.last_visit,
      this.pending,
      this.score,
      this.total_time,
      this.type,

    ],
    this.itineraryDetail, [
      this.description,
      this.filepath,
      this.progress,
      this.title,
    ],
    this.user, [
    this.firstname,
    this.lastname,
    this.pathimage,
      this.trainingHours[
        this.hours,
        this.status,
        this.year,
      ]
    ]
  });  
  

  factory PassportModel.fromJson(Map<String, dynamic> json) => PassportModel(
        courseDetail: Object.parse(
          logo: json["logo"],
          name: json["name"],
          other: json["other"],
          psw: json["psw"],
          user: json["user"],
        )
        globalsituation: Object.parse(
          logo: json["logo"],
          name: json["name"],
          other: json["other"],
          psw: json["psw"],
          user: json["user"],
        )
        itineraryDetail: Object.parse(
          logo: json["logo"],
          name: json["name"],
          other: json["other"],
          psw: json["psw"],
          user: json["user"],
        )
        user: Object.parse(
          logo: json["logo"],
          name: json["name"],
          other: json["other"],
          psw: json["psw"],
          user: json["user"],
        )
      );
}
