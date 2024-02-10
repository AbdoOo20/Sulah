// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? code;
  Data? data;
  String? message;

  UserModel({
    this.code,
    this.data,
    this.message,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
  int? id;
  String? name;
  String? email;
  String? phone;
  String? type;
  int? rate;
  String? phoneCode;
  String? address;
  int? latitude;
  int? longitude;
  String? logo;
  String? commercialRegister;
  int? userCategoryId;
  dynamic userCategory;
  int? notificationStatus;
  int? isVerified;
  int? status;
  String? registerFrom;
  int? isBlock;
  String? token;

  Data({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.type,
    this.rate,
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
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    type: json["type"],
    rate: json["rate"],
    phoneCode: json["phone_code"],
    address: json["address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    logo: json["logo"],
    commercialRegister: json["commercial_register"],
    userCategoryId: json["user_category_id"],
    userCategory: json["user_category"],
    notificationStatus: json["notification_status"],
    isVerified: json["is_verified"],
    status: json["status"],
    registerFrom: json["register_from"],
    isBlock: json["is_block"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "type": type,
    "rate": rate,
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
    "token": token,
  };
}
