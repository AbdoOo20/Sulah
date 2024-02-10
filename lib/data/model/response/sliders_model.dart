class SlidersModel {
  int? code;
  List<Datum>? data;
  String? message;

  SlidersModel({
    this.code,
    this.data,
    this.message,
  });

  factory SlidersModel.fromJson(Map<String, dynamic> json) => SlidersModel(
    code: json["code"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  int? id;
  String? title;
  String? description;
  String? link;
  String? image;

  Datum({
    this.id,
    this.title,
    this.description,
    this.link,
    this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    link: json["link"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "link": link,
    "image": image,
  };
}
