// To parse this JSON data, do
//
//     final oneOrderModel = oneOrderModelFromJson(jsonString);

import 'dart:convert';

import 'myOrdersModel.dart';

OneOrderModel oneOrderModelFromJson(String str) => OneOrderModel.fromJson(json.decode(str));

String oneOrderModelToJson(OneOrderModel data) => json.encode(data.toJson());

class OneOrderModel {
  MyOneOrderModel? data;
  String? message;
  int? code;

  OneOrderModel({
    this.data,
    this.message,
    this.code,
  });

  factory OneOrderModel.fromJson(Map<String, dynamic> json) => OneOrderModel(
    data: json["data"] == null ? null : MyOneOrderModel.fromJson(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "code": code,
  };
}
