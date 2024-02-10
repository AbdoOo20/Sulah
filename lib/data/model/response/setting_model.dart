
class SettingModel {
  Data? data;
  String? message;
  int? code;

  SettingModel({
    this.data,
    this.message,
    this.code,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "code": code,
  };
}

class Data {
  String? twitter;
  String? facebook;
  String? instagram;
  String? snapchat;
  String? linkedin;
  String? youtube;
  String? whatsapp;
  String? email;
  String? phone;
  String? otherPhone;
  String? aboutUs;
  String? termisCondition;
  String? privacyPolicy;

  Data({
    this.twitter,
    this.facebook,
    this.instagram,
    this.snapchat,
    this.linkedin,
    this.youtube,
    this.whatsapp,
    this.email,
    this.phone,
    this.otherPhone,
    this.aboutUs,
    this.termisCondition,
    this.privacyPolicy,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    twitter: json["twitter"],
    facebook: json["facebook"],
    instagram: json["instagram"],
    snapchat: json["snapchat"],
    linkedin: json["linkedin"],
    youtube: json["youtube"],
    whatsapp: json["whatsapp"],
    email: json["email"],
    phone: json["phone"],
    otherPhone: json["other_phone"],
    aboutUs: json["about_us"],
    termisCondition: json["termis_condition"],
    privacyPolicy: json["privacy_policy"],
  );

  Map<String, dynamic> toJson() => {
    "twitter": twitter,
    "facebook": facebook,
    "instagram": instagram,
    "snapchat": snapchat,
    "linkedin": linkedin,
    "youtube": youtube,
    "whatsapp": whatsapp,
    "email": email,
    "phone": phone,
    "other_phone": otherPhone,
    "about_us": aboutUs,
    "termis_condition": termisCondition,
    "privacy_policy": privacyPolicy,
  };
}
