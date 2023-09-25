import 'dart:convert';

AssetEditModel assetEditModelFromJson(String str) =>
    AssetEditModel.fromJson(json.decode(str));

String assetEditModelToJson(AssetEditModel data) => json.encode(data.toJson());

class AssetEditModel {
  AssetEditModel({
    this.id,
    this.name,
    this.status,
    this.location,
  });

  String? id;
  String? name;
  Status? status;
  Location? location;

  factory AssetEditModel.fromJson(Map<String, dynamic> json) => AssetEditModel(
        id: json["id"],
        name: json["name"],
        status: json["status"] != null ? Status.fromJson(json["status"]) : null,
        location: json["location"] != null
            ? Location.fromJson(json["location"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status?.toJson,
        "location": location?.toJson,
      };
}

class Status {
  Status({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Location {
  Location({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
