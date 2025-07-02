
import 'package:sulah/data/model/response/nearBranchModel.dart';

class BranchesModel {
  List<OneBranch>? data;
  String? message;
  int? code;

  BranchesModel({
    this.data,
    this.message,
    this.code,
  });

  factory BranchesModel.fromJson(Map<String, dynamic> json) => BranchesModel(
      data: json["data"] == null ? [] : List<OneBranch>.from(json["data"]!.map((x) => OneBranch.fromJson(x))),
  message: json["message"],
  code: json["code"],
  );

  Map<String, dynamic> toJson() => {
  "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  "message": message,
  "code": code,
};
}


class City {
  int? id;
  String? title;
  int? regionId;

  City({
    this.id,
    this.title,
    this.regionId,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    title: json["title"],
    regionId: json["region_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "region_id": regionId,
  };
}

class Region {
  int? id;
  String? title;
  List<City>? cities;

  Region({
    this.id,
    this.title,
    this.cities,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
      id: json["id"],
      title: json["title"],
      cities: json["cities"] == null ? [] : List<City>.from(json["cities"]!.map((x) => City.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
  "id": id,
  "title": title,
  "cities": cities == null ? [] : List<dynamic>.from(cities!.map((x) => x.toJson())),
};
}
