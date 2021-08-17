// To parse this JSON data, do
//
//     final modelUserProfile = modelUserProfileFromJson(jsonString);

import 'dart:convert';

ModelUserProfile modelUserProfileFromJson(String str) => ModelUserProfile.fromJson(json.decode(str));

String modelUserProfileToJson(ModelUserProfile data) => json.encode(data.toJson());

class ModelUserProfile {
    ModelUserProfile({
        this.aplications,
        this.department,
        this.dni,
        this.email,
        this.fileName,
        this.funcion,
        this.id,
        this.image,
        this.name,
        this.password,
        this.surname,
        this.territorial,
        this.type,
        this.userName,
    });

    List<Aplication> aplications;
    String department;
    String dni;
    String email;
    String fileName;
    String funcion;
    int id;
    String image;
    String name;
    String password;
    String surname;
    String territorial;
    String type;
    String userName;

    factory ModelUserProfile.fromJson(Map<String, dynamic> json) => ModelUserProfile(
        aplications: List<Aplication>.from(json["aplications"].map((x) => Aplication.fromJson(x))),
        department: json["department"],
        dni: json["dni"],
        email: json["email"],
        fileName: json["fileName"],
        funcion: json["funcion"],
        id: json["id"],
        image: json["image"],
        name: json["name"],
        password: json["password"],
        surname: json["surname"],
        territorial: json["territorial"],
        type: json["type"],
        userName: json["userName"],
    );

    Map<String, dynamic> toJson() => {
        "aplications": List<dynamic>.from(aplications.map((x) => x.toJson())),
        "department": department,
        "dni": dni,
        "email": email,
        "fileName": fileName,
        "funcion": funcion,
        "id": id,
        "image": image,
        "name": name,
        "password": password,
        "surname": surname,
        "territorial": territorial,
        "type": type,
        "userName": userName,
    };
}

class Aplication {
    Aplication({
        this.logo,
        this.name,
        this.other,
        this.psw,
        this.user,
    });

    String logo;
    String name;
    String other;
    String psw;
    String user;

    factory Aplication.fromJson(Map<String, dynamic> json) => Aplication(
        logo: json["logo"],
        name: json["name"],
        other: json["other"],
        psw: json["psw"],
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "logo": logo,
        "name": name,
        "other": other,
        "psw": psw,
        "user": user,
    };
}
