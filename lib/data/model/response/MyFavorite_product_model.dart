// To parse this JSON data, do
//
//     final myFavoriteProductModel = myFavoriteProductModelFromJson(jsonString);

import 'dart:convert';

import 'one_product_model.dart';

MyFavoriteProductModel myFavoriteProductModelFromJson(String str) => MyFavoriteProductModel.fromJson(json.decode(str));

String myFavoriteProductModelToJson(MyFavoriteProductModel data) => json.encode(data.toJson());

class MyFavoriteProductModel {
  int? code;
  List<OneProduct>? data;
  String? message;

  MyFavoriteProductModel({
    this.code,
    this.data,
    this.message,
  });

  factory MyFavoriteProductModel.fromJson(Map<String, dynamic> json) => MyFavoriteProductModel(
    code: json["code"],
    data: json["data"] == null ? [] : List<OneProduct>.from(json["data"]!.map((x) => OneProduct.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

