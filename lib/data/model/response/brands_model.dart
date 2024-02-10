class BrandsModel {
  int? code;
  List<BrandModel>? data;
  String? message;

  BrandsModel({
    this.code,
    this.data,
    this.message,
  });

  factory BrandsModel.fromJson(Map<String, dynamic> json) => BrandsModel(
    code: json["code"],
    data: json["data"] == null ? [] : List<BrandModel>.from(json["data"]!.map((x) => BrandModel.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class BrandModel {
  int? id;
  String? title;
  String? image;

  BrandModel({
    this.id,
    this.title,
    this.image,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
    id: json["id"],
    title: json["title"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
  };
}
