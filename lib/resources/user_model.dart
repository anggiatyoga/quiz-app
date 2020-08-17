import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    this.id,
    this.nama,
    this.npm,
    this.hasil,
  });

  String id;
  String nama;
  String npm;
  String hasil;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        nama: json["nama"],
        npm: json["npm"],
        hasil: json["hasil"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "npm": npm,
        "hasil": hasil,
      };
}
