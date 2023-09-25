import 'dart:convert';

AssetModel assetModelFromJson(String str) =>
    AssetModel.fromJson(json.decode(str));

String assetModelToJson(AssetModel data) => json.encode(data.toJson());

class AssetModel {
  AssetModel({
    this.id,
    this.name,
    this.status_id,
    this.location_id,
  });

  String? id;
  String? name;
  String? status_id;
  String? location_id;

  factory AssetModel.fromJson(Map<String, dynamic> json) => AssetModel(
        id: json["id"],
        name: json["name"],
        status_id: json["status_id"],
        location_id: json["location_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status_id": status_id,
        "location_id": location_id,
      };
}
