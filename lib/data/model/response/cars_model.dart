class CarsModel {
  int? code;
  List<CarModel>? data;
  String? message;

  CarsModel({
    this.code,
    this.data,
    this.message,
  });

  factory CarsModel.fromJson(Map<String, dynamic> json) => CarsModel(
    code: json["code"],
    data: json["data"] == null ? [] : List<CarModel>.from(json["data"]!.map((x) => CarModel.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class CarModel {
  int? id;
  String? title;

  CarModel({
    this.id,
    this.title,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}
