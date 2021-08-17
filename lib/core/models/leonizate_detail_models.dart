// To parse this JSON data, do
//
//     final modelLeonizateDetail = modelLeonizateDetailFromJson(jsonString);

import 'dart:convert';

ModelLeonizateDetail modelLeonizateDetailFromJson(String str) => ModelLeonizateDetail.fromJson(json.decode(str));

String modelLeonizateDetailToJson(ModelLeonizateDetail data) => json.encode(data.toJson());

class ModelLeonizateDetail {
    ModelLeonizateDetail({
        this.ligadetalle,
        this.tucapacidadcursos,
        this.tucapacitinerarios,
        this.tuconocimientodetalle,
        this.tuconocimientototal,
        this.tusrecursosdetalle,
        this.tusrecursostotal,
    });

    Ligadetalle ligadetalle;
    Tucapaci tucapacidadcursos;
    Tucapaci tucapacitinerarios;
    List<Detalle> tuconocimientodetalle;
    Total tuconocimientototal;
    List<Detalle> tusrecursosdetalle;
    Total tusrecursostotal;

    factory ModelLeonizateDetail.fromJson(Map<String, dynamic> json) => ModelLeonizateDetail(
        ligadetalle: Ligadetalle.fromJson(json["ligadetalle"]),
        tucapacidadcursos: Tucapaci.fromJson(json["tucapacidadcursos"]),
        tucapacitinerarios: Tucapaci.fromJson(json["tucapacitinerarios"]),
        tuconocimientodetalle: List<Detalle>.from(json["tuconocimientodetalle"].map((x) => Detalle.fromJson(x))),
        tuconocimientototal: Total.fromJson(json["tuconocimientototal"]),
        tusrecursosdetalle: List<Detalle>.from(json["tusrecursosdetalle"].map((x) => Detalle.fromJson(x))),
        tusrecursostotal: Total.fromJson(json["tusrecursostotal"]),
    );

    Map<String, dynamic> toJson() => {
        "ligadetalle": ligadetalle.toJson(),
        "tucapacidadcursos": tucapacidadcursos.toJson(),
        "tucapacitinerarios": tucapacitinerarios.toJson(),
        "tuconocimientodetalle": List<dynamic>.from(tuconocimientodetalle.map((x) => x.toJson())),
        "tuconocimientototal": tuconocimientototal.toJson(),
        "tusrecursosdetalle": List<dynamic>.from(tusrecursosdetalle.map((x) => x.toJson())),
        "tusrecursostotal": tusrecursostotal.toJson(),
    };
}

class Ligadetalle {
    Ligadetalle({
        this.pointsbronce,
        this.pointsmaster,
        this.pointsoro,
        this.pointsplata,
        this.totalusers,
        this.usersbronce,
        this.usersmaster,
        this.usersoro,
        this.usersplata,
    });

    int pointsbronce;
    int pointsmaster;
    int pointsoro;
    int pointsplata;
    int totalusers;
    int usersbronce;
    int usersmaster;
    int usersoro;
    int usersplata;

    factory Ligadetalle.fromJson(Map<String, dynamic> json) => Ligadetalle(
        pointsbronce: json["pointsbronce"],
        pointsmaster: json["pointsmaster"],
        pointsoro: json["pointsoro"],
        pointsplata: json["pointsplata"],
        totalusers: json["totalusers"],
        usersbronce: json["usersbronce"],
        usersmaster: json["usersmaster"],
        usersoro: json["usersoro"],
        usersplata: json["usersplata"],
    );

    Map<String, dynamic> toJson() => {
        "pointsbronce": pointsbronce,
        "pointsmaster": pointsmaster,
        "pointsoro": pointsoro,
        "pointsplata": pointsplata,
        "totalusers": totalusers,
        "usersbronce": usersbronce,
        "usersmaster": usersmaster,
        "usersoro": usersoro,
        "usersplata": usersplata,
    };
}

class Tucapaci {
    Tucapaci({
        this.maxPoints,
        this.percentage,
        this.points,
        this.status,
    });

    int maxPoints;
    int percentage;
    int points;
    String status;

    factory Tucapaci.fromJson(Map<String, dynamic> json) => Tucapaci(
        maxPoints: json["max_points"],
        percentage: json["percentage"],
        points: json["points"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "max_points": maxPoints,
        "percentage": percentage,
        "points": points,
        "status": status,
    };
}

class Detalle {
    Detalle({
        this.percentage,
        this.points,
        this.status,
        this.year,
    });

    int percentage;
    int points;
    String status;
    int year;

    factory Detalle.fromJson(Map<String, dynamic> json) => Detalle(
        percentage: json["percentage"],
        points: json["points"],
        status: json["status"],
        year: json["year"],
    );

    Map<String, dynamic> toJson() => {
        "percentage": percentage,
        "points": points,
        "status": status,
        "year": year,
    };
}

class Total {
    Total({
        this.totalhours,
        this.totalpercentage,
    });

    int totalhours;
    int totalpercentage;

    factory Total.fromJson(Map<String, dynamic> json) => Total(
        totalhours: json["totalhours"],
        totalpercentage: json["totalpercentage"],
    );

    Map<String, dynamic> toJson() => {
        "totalhours": totalhours,
        "totalpercentage": totalpercentage,
    };
}
