import 'dart:convert';

List<ProfileModel> profileModelFromJson(String str) => List<ProfileModel>.from(json.decode(str).map((x) => ProfileModel.fromJson(x)));

class ProfileModel {
  ProfileModel({
    this.aplications, [
      this.logo,
      this.name,
      this.other,
      this.psw,
      this.user
    ],
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

  
  [String] aplications;
  String logo;
  String name;
  String other;
  String psw;
  String user;
  String department;
  String dni;
  String email;
  String fileName;
  String funcion;
  Integer id;
  String image;
  String name;
  String password;
  String surname;
  String territorial;
  String type;
  String userName;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        aplications: Object.parse(
          logo: json["logo"],
          name: json["name"],
          other: json["other"],
          psw: json["psw"],
          user: json["user"],
        )        
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
}
