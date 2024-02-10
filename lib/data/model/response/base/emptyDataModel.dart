
class EmptyDataModel {
  dynamic data;
  String? message;
  int? code;

  EmptyDataModel({
    this.data,
    this.message,
    this.code,
  });

  factory EmptyDataModel.fromJson(Map<String, dynamic> json) => EmptyDataModel(
    data: json["data"],
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "message": message,
    "code": code,
  };
}
