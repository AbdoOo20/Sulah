import 'one_store_model.dart';

class StoresModel {
  String? message;
  int? code;
  List<OneStore>? data;

  StoresModel({
    this.message,
    this.code,
    this.data,
  });

  factory StoresModel.fromJson(Map<String, dynamic> json) => StoresModel(
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? [] : List<OneStore>.from(json["data"]!.map((x) => OneStore.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

