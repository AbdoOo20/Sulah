class DepartmentsModel {
  String? message;
  int? code;
  List<Departments>? data;

  DepartmentsModel({
    this.message,
    this.code,
    this.data,
  });

  factory DepartmentsModel.fromJson(Map<String, dynamic> json) => DepartmentsModel(
    message: json["message"],
    code: json["code"],
    data: json["data"] == null ? [] : List<Departments>.from(json["data"]!.map((x) => Departments.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Departments {
  int? id;
  String? title;
  String? image;

  Departments({
    this.id,
    this.title,
    this.image,
  });

  factory Departments.fromJson(Map<String, dynamic> json) => Departments(
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
