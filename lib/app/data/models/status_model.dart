import 'dart:convert';

StatusModel statusModelFromJson(String str) =>
    StatusModel.fromJson(json.decode(str));

String statusModelToJson(StatusModel results) => json.encode(results.toJson());

class StatusModel {
  StatusModel({
    this.results,
  });

  List<Results>? results;

  factory StatusModel.fromJson(Map<String, dynamic> json) => StatusModel(
        results:
            List<Results>.from(json["results"].map((x) => Results.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<String>.from(results!.map((x) => x.toJson())),
      };
}

class Results {
  Results({
    this.status,
    this.count,
  });

  Status? status;
  int? count;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        status: json["status"] != null ? Status.fromJson(json["status"]) : null,
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "status": status?.toJson,
        "count": count,
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
