import 'one_store_model.dart';

class NearestStoresModel {
  int? code;
  List<OneStore>? data;
  String? message;

  NearestStoresModel({
    this.code,
    this.data,
    this.message,
  });

  factory NearestStoresModel.fromJson(Map<String, dynamic> json) => NearestStoresModel(
    code: json["code"],
    data: json["data"] == null ? [] : List<OneStore>.from(json["data"]!.map((x) => OneStore.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}


