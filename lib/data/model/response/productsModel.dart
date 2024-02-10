import 'one_product_model.dart';

class ProductsModel {
  List<OneProduct>? data;
  String? message;
  int? code;

  ProductsModel({
    this.data,
    this.message,
    this.code,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
      data: json["data"] == null ? [] : List<OneProduct>.from(json["data"]!.map((x) => OneProduct.fromJson(x))),
  message: json["message"],
  code: json["code"],
  );

  Map<String, dynamic> toJson() => {
  "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  "message": message,
  "code": code,
};
}