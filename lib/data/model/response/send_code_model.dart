class SendCodeModel {
  int? code;
  Data? data;
  String? message;

  SendCodeModel({
    this.code,
    this.data,
    this.message,
  });

  factory SendCodeModel.fromJson(Map<String, dynamic> json) => SendCodeModel(
    code: json["code"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  String? code;

  Data({
    this.code,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
  };
}
