// import 'dart:convert';

<<<<<<< HEAD
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
=======
// List<ProfileModel> profileModelFromJson(String str) => List<ProfileModel>.from(json.decode(str).map((x) => ProfileModel.fromJson(x)));

// class ProfileModel {
//   ProfileModel({
//     this.aplications, [
//       this.logo,
//       this.name,
//       this.other,
//       this.psw,
//       this.user
//     ],
//     this.department,
//     this.dni,
//     this.email,
//     this.fileName,
//     this.funcion,
//     this.id,
//     this.image,
//     this.name,
//     this.password,
//     this.surname,
//     this.territorial,
//     this.type,
//     this.userName,
//   });
>>>>>>> 3378901ed6255955c383cb20ac7e42e76322b767

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
  
<<<<<<< HEAD

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
=======
//   [String] aplications;
//   String logo;
//   String name;
//   String other;
//   String psw;
//   String user;
//   String department;
//   String dni;
//   String email;
//   String fileName;
//   String funcion;
//   Integer id;
//   String image;
//   String name;
//   String password;
//   String surname;
//   String territorial;
//   String type;
//   String userName;

//   factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
//         aplications: Object.parse(
//           logo: json["logo"],
//           name: json["name"],
//           other: json["other"],
//           psw: json["psw"],
//           user: json["user"],
//         )        
//         department: json["department"],
//         dni: json["dni"],
//         email: json["email"],
//         fileName: json["fileName"],
//         funcion: json["funcion"],
//         id: json["id"],
//         image: json["image"],
//         name: json["name"],
//         password: json["password"],
//         surname: json["surname"],
//         territorial: json["territorial"],
//         type: json["type"],
//         userName: json["userName"],
//       );
// }
>>>>>>> 3378901ed6255955c383cb20ac7e42e76322b767
