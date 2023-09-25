import 'dart:convert';

StatusAllModel statusAllModelFromJson(String str) =>
    StatusAllModel.fromJson(json.decode(str));

String statusAllModelToJson(StatusAllModel results) =>
    json.encode(results.toJson());

class StatusAllModel {
  StatusAllModel({
    this.results,
  });

  List<Results>? results;

  factory StatusAllModel.fromJson(Map<String, dynamic> json) => StatusAllModel(
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
