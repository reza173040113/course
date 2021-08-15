import 'dart:convert';

List<ProfileModel> profileModelFromJson(String str) => List<ProfileModel>.from(json.decode(str).map((x) => ProfileModel.fromJson(x)));

class ProfileModel {
  ProfileModel({
    this.nama,
    this.telp,
    this.biaya,
    this.deskripsi,
    this.alamat,
    this.gambar,
    this.createdAt,
  });

  String nama;
  String telp;
  String biaya;
  String deskripsi;
  String alamat;
  String gambar;
  DateTime createdAt;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        nama: json["nama"],
        telp: json["telp"],
        biaya: json["biaya"],
        deskripsi: json["deskripsi"],
        alamat: json["alamat"],
        gambar: json["gambar"],
        createdAt: DateTime.parse(json["created_at"]),
      );
}
