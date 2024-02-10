// To parse this JSON data, do
//
//     final storeRateModel = storeRateModelFromJson(jsonString);

import 'dart:convert';

StoreRateModel storeRateModelFromJson(String str) => StoreRateModel.fromJson(json.decode(str));

String storeRateModelToJson(StoreRateModel data) => json.encode(data.toJson());

class StoreRateModel {
  int? code;
  List<Datum>? data;
  String? message;

  StoreRateModel({
    this.code,
    this.data,
    this.message,
  });

  factory StoreRateModel.fromJson(Map<String, dynamic> json) => StoreRateModel(
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
  num? rate;
  int? fromUserId;
  User? fromUser;
  int? toUserId;
  User? toUser;
  String? comment;
  String? createdAt;

  Datum({
    this.id,
    this.rate,
    this.fromUserId,
    this.fromUser,
    this.toUserId,
    this.toUser,
    this.comment,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    rate: json["rate"],
    fromUserId: json["from_user_id"],
    fromUser: json["from_user"] == null ? null : User.fromJson(json["from_user"]),
    toUserId: json["to_user_id"],
    toUser: json["to_user"] == null ? null : User.fromJson(json["to_user"]),
    comment: json["comment"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rate": rate,
    "from_user_id": fromUserId,
    "from_user": fromUser?.toJson(),
    "to_user_id": toUserId,
    "to_user": toUser?.toJson(),
    "comment": comment,
    "created_at": createdAt,
  };
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? type;
  num? rate;
  num? rateCount;
  String? phoneCode;
  String? address;
  double? latitude;
  double? longitude;
  String? logo;
  String? commercialRegister;
  int? userCategoryId;
  dynamic userCategory;
  int? notificationStatus;
  int? isVerified;
  int? status;
  String? registerFrom;
  int? isBlock;
  int? isSaved;
  String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.type,
    this.rate,
    this.rateCount,
    this.phoneCode,
    this.address,
    this.latitude,
    this.longitude,
    this.logo,
    this.commercialRegister,
    this.userCategoryId,
    this.userCategory,
    this.notificationStatus,
    this.isVerified,
    this.status,
    this.registerFrom,
    this.isBlock,
    this.isSaved,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    type: json["type"],
    rate: json["rate"],
    rateCount: json["rate_count"],
    phoneCode: json["phone_code"],
    address: json["address"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    logo: json["logo"],
    commercialRegister: json["commercial_register"],
    userCategoryId: json["user_category_id"],
    userCategory: json["user_category"],
    notificationStatus: json["notification_status"],
    isVerified: json["is_verified"],
    status: json["status"],
    registerFrom: json["register_from"],
    isBlock: json["is_block"],
    isSaved: json["is_saved"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "type": type,
    "rate": rate,
    "rate_count": rateCount,
    "phone_code": phoneCode,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "logo": logo,
    "commercial_register": commercialRegister,
    "user_category_id": userCategoryId,
    "user_category": userCategory,
    "notification_status": notificationStatus,
    "is_verified": isVerified,
    "status": status,
    "register_from": registerFrom,
    "is_block": isBlock,
    "is_saved": isSaved,
    "token": token,
  };
}
