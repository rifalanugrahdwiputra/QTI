import 'dart:convert';

LocationAllModel locationAllModelFromJson(String str) =>
    LocationAllModel.fromJson(json.decode(str));

String locationAllModelToJson(LocationAllModel results) =>
    json.encode(results.toJson());

class LocationAllModel {
  LocationAllModel({
    this.results,
  });

  List<Results>? results;

  factory LocationAllModel.fromJson(Map<String, dynamic> json) =>
      LocationAllModel(
        results:
            List<Results>.from(json["results"].map((x) => Results.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<String>.from(results!.map((x) => x.toJson())),
      };
}

class Results {
  Results({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
