// import 'dart:convert';

<<<<<<< HEAD
import 'package:generali/core/models/improvement_models.dart';

List<NewsModel> newsModelFromJson(String str) => List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

class NewsModel {
  NewsModel({
    this.characteristics,
    this.id,
    this.image,
    this.modality,
    this.rating,
    this.status,
    this.title,
    this.type,
    this.first,
    this.last,
    this.number,
    this.totalElements,
    this.totalPages, content,
  });

  String characteristics;
  List<String> content;
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

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        content: Object.parse(
          characteristics: json["characteristics"],
          id: json["id"],
          image: json["image"],
          modality: json["modality"],
          rating: json["rating"],
          status: json["status"],
          title: json["title"],
          type: json["type"]
        ), 
        first: json["first"],
        last: json["last"],
        number: json["number"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"]
      );
}

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
