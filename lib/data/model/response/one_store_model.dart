class OneStoreModel {
  int? code;
  OneStore? data;
  String? message;

  OneStoreModel({
    this.code,
    this.data,
    this.message,
  });

  factory OneStoreModel.fromJson(Map<String, dynamic> json) => OneStoreModel(
    code: json["code"],
    data: json["data"] == null ? null : OneStore.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data?.toJson(),
    "message": message,
  };
}











class OneStore {
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
  UserCategory? userCategory;
  int? notificationStatus;
  int? isVerified;
  int? status;
  String? registerFrom;
  int? isBlock;
  int? isSaved;
  String? token;
bool?isStoreFavorite;
  OneStore({
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
    this.isStoreFavorite,
  });

  factory OneStore.fromJson(Map<String, dynamic> json) => OneStore(
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
    userCategory: json["user_category"] == null ? null : UserCategory.fromJson(json["user_category"]),
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
    "user_category": userCategory?.toJson(),
    "notification_status": notificationStatus,
    "is_verified": isVerified,
    "status": status,
    "register_from": registerFrom,
    "is_block": isBlock,
    "is_saved": isSaved,
    "token": token,
  };
}

class UserCategory {
  int? id;
  String? title;
  String? description;
  String? image;

  UserCategory({
    this.id,
    this.title,
    this.description,
    this.image,
  });

  factory UserCategory.fromJson(Map<String, dynamic> json) => UserCategory(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image": image,
  };
}