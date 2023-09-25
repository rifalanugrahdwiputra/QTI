import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    this.id,
    this.email,
    this.username,
    this.is_active,
    this.token,
  });

  String? id;
  String? email;
  String? username;
  bool? is_active;
  String? token;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        id: json["id"],
        email: json["email"],
        username: json["username"],
        is_active: json["is_active"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "is_active": is_active,
        "token": token,
      };
}
