import 'dart:convert';

LocationModel locationModelFromJson(String str) =>
    LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel results) =>
    json.encode(results.toJson());

class LocationModel {
  LocationModel({
    this.results,
  });

  List<ResultsLocation>? results;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        results: List<ResultsLocation>.from(
            json["results"].map((x) => ResultsLocation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<String>.from(results!.map((x) => x.toJson())),
      };
}

class ResultsLocation {
  ResultsLocation({
    this.location,
    this.count,
  });

  Location? location;
  int? count;

  factory ResultsLocation.fromJson(Map<String, dynamic> json) =>
      ResultsLocation(
        location: json["location"] != null
            ? Location.fromJson(json["location"])
            : null,
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "location": location?.toJson,
        "count": count,
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
