import 'dart:convert';

AssetAllModel assetAllModelFromJson(String str) =>
    AssetAllModel.fromJson(json.decode(str));

String assetAllModelToJson(AssetAllModel data) => json.encode(data.toJson());

class AssetAllModel {
  AssetAllModel({
    this.count,
    this.page_count,
    this.page_size,
    this.page,
    this.results,
  });

  int? count;
  int? page_count;
  int? page_size;
  int? page;
  List<Results>? results;

  factory AssetAllModel.fromJson(Map<String, dynamic> json) => AssetAllModel(
        count: json["count"],
        page_count: json["page_count"],
        page_size: json["page_size"],
        page: json["page"],
        results:
            List<Results>.from(json["results"].map((x) => Results.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "page_count": page_count,
        "page_size": page_size,
        "page": page,
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
