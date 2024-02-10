class NotificationModel {
  List<Datum>? data;
  String? message;
  int? code;

  NotificationModel({
    this.data,
    this.message,
    this.code,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
    "code": code,
  };
}

class Datum {
  int? id;
  String? title;
  String? body;
  int? orderId;
  String? type;
  String? createdAt;
  DateTime? date;
  String? time;

  Datum({
    this.id,
    this.title,
    this.body,
    this.orderId,
    this.type,
    this.createdAt,
    this.date,
    this.time,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    orderId: json["order_id"],
    type: json["type"],
    createdAt: json["created_at"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "order_id": orderId,
    "type": type,
    "created_at": createdAt,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
  };
}
