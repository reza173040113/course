import 'dart:convert';

List<ProfileModel> profileModelFromJson(String str) => List<ProfileModel>.from(json.decode(str).map((x) => ProfileModel.fromJson(x)));

class ProfileModel {
  ProfileModel({
    this.ligadetalle,
    this.tucapacitinerarios,
    this.tucapacidadcursos,
    this.tuconocimientototal,
    this.tusrecursosdetalle,
    this.tusrecursostotal,
     this.year,
     this.max_points,
     this.percentage,
     this.totalhours,
     this.totalpercentage,
     this.points,
     this.status,
     this.pointsmaster,
     this.pointsoro,
     this.pointsplata,
     this.totalusers,
     this.usersbronce,
     this.usersmaster,
     this.usersoro,
     this.usersplata, pointsbronce, tuconocimientodetalle,
  });
    List<String> ligadetalle;
    List<String> tucapacitinerarios;
    List<String> tucapacidadcursos;
    List<String> tuconocimientototal;
    List<String> tusrecursosdetalle;
    List<String> tusrecursostotal;
    Integer year;
    Integer max_points;
    Integer percentage;
    Integer totalhours;
    Integer totalpercentage;
    Integer points;
    Integer status;
    Integer pointsbronce;
    Integer pointsmaster;
    Integer pointsoro;
    Integer pointsplata;
    Integer totalusers;
    Integer usersbronce;
    Integer usersmaster;
    Integer usersoro;
    Integer usersplata;


  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    ligadetalle:Object.parse(      
     pointsbronce:json["pointsbronce"],
     pointsmaster:json["pointsmaster"],
     pointsoro:json["pointsoro"],
     pointsplata:json["pointsplata"],
     totalusers:json["totalusers"],
     usersbronce:json["usersbronce"],
     usersmaster:json["usersmaster"],
     usersoro:json["usersoro"],
     usersplata:json["usersplata"],
    ),
    tucapacidadcursos:Object.parse(
      max_points:json["max_points"],
      percentage:json["percentage"],
      points:json["points"],
      status:json["status"],
    ),
    tucapacitinerarios:Object.parse(
      percentage:json["percentage"],
      points:json["points"],
      max_points:json["max_points"],
      status:json["status"],
    ),
    tuconocimientodetalle:Object.parse(
      percentage:json["percentage"],
      points:json["points"],
      year:json["year"],
      status:json["status"],
    ),
    tuconocimientototal:Object.parse(
      totalhours:json["totalhours"],
     totalpercentage:json["totalpercentage"],
    ),
    tusrecursosdetalle:Object.parse(
      percentage:json["percentage"],
      points:json["points"],
      year:json["year"],
      status:json["status"],
    ),
    tusrecursostotal:Object.parse(
      totalhours:json["totalhours"],
      totalpercentage:json["totalpercentage"]
    ),
     year:json["year"],
     max_points:json["max_points"],
     percentage:json["percentage"],
     points:json["points"],
     status:json["status"],     
     pointsbronce:json["pointsbronce"],
     pointsmaster:json["pointsmaster"],
     pointsoro:json["pointsoro"],
     pointsplata:json["pointsplata"],
     totalusers:json["totalusers"],
     usersbronce:json["usersbronce"],
     usersmaster:json["usersmaster"],
     usersoro:json["usersoro"],
     usersplata:json["usersplata"],
      );
}

class Integer {
}
