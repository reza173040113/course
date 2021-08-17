// To parse this JSON data, do
//
//     final modelPassportDetail = modelPassportDetailFromJson(jsonString);

import 'dart:convert';

ModelPassportDetail modelPassportDetailFromJson(String str) => ModelPassportDetail.fromJson(json.decode(str));

String modelPassportDetailToJson(ModelPassportDetail data) => json.encode(data.toJson());

class ModelPassportDetail {
    ModelPassportDetail({
        this.courseDetail,
        this.globalsituation,
        this.itineraryDetail,
        this.user,
    });

    List<CourseDetail> courseDetail;
    List<Globalsituation> globalsituation;
    List<ItineraryDetail> itineraryDetail;
    User user;

    factory ModelPassportDetail.fromJson(Map<String, dynamic> json) => ModelPassportDetail(
        courseDetail: List<CourseDetail>.from(json["courseDetail"].map((x) => CourseDetail.fromJson(x))),
        globalsituation: List<Globalsituation>.from(json["globalsituation"].map((x) => Globalsituation.fromJson(x))),
        itineraryDetail: List<ItineraryDetail>.from(json["itineraryDetail"].map((x) => ItineraryDetail.fromJson(x))),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "courseDetail": List<dynamic>.from(courseDetail.map((x) => x.toJson())),
        "globalsituation": List<dynamic>.from(globalsituation.map((x) => x.toJson())),
        "itineraryDetail": List<dynamic>.from(itineraryDetail.map((x) => x.toJson())),
        "user": user.toJson(),
    };
}

class CourseDetail {
    CourseDetail({
        this.duration,
        this.idArea,
        this.modality,
        this.showRealTime,
        this.status,
        this.title,
    });

    String duration;
    int idArea;
    String modality;
    int showRealTime;
    String status;
    String title;

    factory CourseDetail.fromJson(Map<String, dynamic> json) => CourseDetail(
        duration: json["duration"],
        idArea: json["idArea"],
        modality: json["modality"],
        showRealTime: json["showRealTime"],
        status: json["status"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "duration": duration,
        "idArea": idArea,
        "modality": modality,
        "showRealTime": showRealTime,
        "status": status,
        "title": title,
    };
}

class Globalsituation {
    Globalsituation({
        this.endDate,
        this.finished,
        this.firstDate,
        this.lastVisit,
        this.pending,
        this.score,
        this.totalTime,
        this.type,
    });

    String endDate;
    int finished;
    String firstDate;
    String lastVisit;
    int pending;
    int score;
    int totalTime;
    String type;

    factory Globalsituation.fromJson(Map<String, dynamic> json) => Globalsituation(
        endDate: json["end_date"],
        finished: json["finished"],
        firstDate: json["first_date"],
        lastVisit: json["last_visit"],
        pending: json["pending"],
        score: json["score"],
        totalTime: json["total_time"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "end_date": endDate,
        "finished": finished,
        "first_date": firstDate,
        "last_visit": lastVisit,
        "pending": pending,
        "score": score,
        "total_time": totalTime,
        "type": type,
    };
}

class ItineraryDetail {
    ItineraryDetail({
        this.description,
        this.filepath,
        this.progress,
        this.title,
    });

    String description;
    String filepath;
    String progress;
    String title;

    factory ItineraryDetail.fromJson(Map<String, dynamic> json) => ItineraryDetail(
        description: json["description"],
        filepath: json["filepath"],
        progress: json["progress"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "filepath": filepath,
        "progress": progress,
        "title": title,
    };
}

class User {
    User({
        this.firstname,
        this.lastname,
        this.pathimage,
        this.trainingHours,
    });

    String firstname;
    String lastname;
    String pathimage;
    List<TrainingHour> trainingHours;

    factory User.fromJson(Map<String, dynamic> json) => User(
        firstname: json["firstname"],
        lastname: json["lastname"],
        pathimage: json["pathimage"],
        trainingHours: List<TrainingHour>.from(json["trainingHours"].map((x) => TrainingHour.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "pathimage": pathimage,
        "trainingHours": List<dynamic>.from(trainingHours.map((x) => x.toJson())),
    };
}

class TrainingHour {
    TrainingHour({
        this.hours,
        this.status,
        this.year,
    });

    int hours;
    String status;
    int year;

    factory TrainingHour.fromJson(Map<String, dynamic> json) => TrainingHour(
        hours: json["hours"],
        status: json["status"],
        year: json["year"],
    );

    Map<String, dynamic> toJson() => {
        "hours": hours,
        "status": status,
        "year": year,
    };
}
