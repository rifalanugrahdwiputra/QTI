import 'dart:convert';

MeModel meModelFromJson(String str) => MeModel.fromJson(json.decode(str));

String meModelToJson(MeModel data) => json.encode(data.toJson());

class MeModel {
  MeModel({
    this.id,
    this.email,
    this.username,
    this.is_active,
    this.refreshed_token,
  });

  String? id;
  String? email;
  String? username;
  bool? is_active;
  String? refreshed_token;

  factory MeModel.fromJson(Map<String, dynamic> json) => MeModel(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        is_active: json["is_active"],
        refreshed_token: json["refreshed_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "is_active": is_active,
        "refreshed_token": refreshed_token,
      };
}
