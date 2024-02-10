class OrdersModel {
  OneSendOrders? data;
  String? message;
  int? code;

  OrdersModel({
    this.data,
    this.message,
    this.code,
  });

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
    data: json["data"] == null ? null : OneSendOrders.fromJson(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "message": message,
    "code": code,
  };
}

class OneSendOrders {
  int? id;
  int? branchId;
  Branch? branch;
  int? userId;
  DataUser? user;
  String? address;
  double? latitude;
  double? longitude;
  String? status;
  String? payType;
  bool? isPaid;
  bool? isPoints;
  num? pointsCount;
  num? pointsValue;
  dynamic driverId;
  dynamic driver;
  num? driverCost;
  num? netTotal;
  double? taxValue;
  double? grandTotal;
  dynamic notes;
  String? createdAt;
  DateTime? date;
  String? time;
  List<Detail>? details;

  OneSendOrders({
    this.id,
    this.branchId,
    this.branch,
    this.userId,
    this.user,
    this.address,
    this.latitude,
    this.longitude,
    this.status,
    this.payType,
    this.isPaid,
    this.isPoints,
    this.pointsCount,
    this.pointsValue,
    this.driverId,
    this.driver,
    this.driverCost,
    this.netTotal,
    this.taxValue,
    this.grandTotal,
    this.notes,
    this.createdAt,
    this.date,
    this.time,
    this.details,
  });

  factory OneSendOrders.fromJson(Map<String, dynamic> json) => OneSendOrders(
    id: json["id"],
    branchId: json["branch_id"],
    branch: json["branch"] == null ? null : Branch.fromJson(json["branch"]),
    userId: json["user_id"],
    user: json["user"] == null ? null : DataUser.fromJson(json["user"]),
    address: json["address"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    status: json["status"],
    payType: json["pay_type"],
    isPaid: json["is_paid"],
    isPoints: json["is_points"],
    pointsCount: json["points_count"],
    pointsValue: json["points_value"],
    driverId: json["driver_id"],
    driver: json["driver"],
    driverCost: json["driver_cost"],
    netTotal: json["net_total"],
    taxValue: json["tax_value"]?.toDouble(),
    grandTotal: json["grand_total"]?.toDouble(),
    notes: json["notes"],
    createdAt: json["created_at"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
    details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "branch_id": branchId,
    "branch": branch?.toJson(),
    "user_id": userId,
    "user": user?.toJson(),
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "status": status,
    "pay_type": payType,
    "is_paid": isPaid,
    "is_points": isPoints,
    "points_count": pointsCount,
    "points_value": pointsValue,
    "driver_id": driverId,
    "driver": driver,
    "driver_cost": driverCost,
    "net_total": netTotal,
    "tax_value": taxValue,
    "grand_total": grandTotal,
    "notes": notes,
    "created_at": createdAt,
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
    "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
  };
}

class Branch {
  int? id;
  String? title;
  int? regionId;
  Region? region;
  int? cityId;
  City? city;
  double? longitude;
  double? latitude;
  num? distance;
  bool? isMain;

  Branch({
    this.id,
    this.title,
    this.regionId,
    this.region,
    this.cityId,
    this.city,
    this.longitude,
    this.latitude,
    this.distance,
    this.isMain,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    id: json["id"],
    title: json["title"],
    regionId: json["region_id"],
    region: json["region"] == null ? null : Region.fromJson(json["region"]),
    cityId: json["city_id"],
    city: json["city"] == null ? null : City.fromJson(json["city"]),
    longitude: json["longitude"]?.toDouble(),
    latitude: json["latitude"]?.toDouble(),
    distance: json["distance"],
    isMain: json["is_main"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "region_id": regionId,
    "region": region?.toJson(),
    "city_id": cityId,
    "city": city?.toJson(),
    "longitude": longitude,
    "latitude": latitude,
    "distance": distance,
    "is_main": isMain,
  };
}

class City {
  int? id;
  String? title;
  int? regionId;

  City({
    this.id,
    this.title,
    this.regionId,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    title: json["title"],
    regionId: json["region_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "region_id": regionId,
  };
}

class Region {
  int? id;
  String? title;
  List<City>? cities;

  Region({
    this.id,
    this.title,
    this.cities,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    id: json["id"],
    title: json["title"],
    cities: json["cities"] == null ? [] : List<City>.from(json["cities"]!.map((x) => City.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "cities": cities == null ? [] : List<dynamic>.from(cities!.map((x) => x.toJson())),
  };
}

class Detail {
  int? id;
  int? productId;
  Product? product;
  num? qty;
  num? netCost;
  num? total;

  Detail({
    this.id,
    this.productId,
    this.product,
    this.qty,
    this.netCost,
    this.total,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"],
    productId: json["product_id"],
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
    qty: json["qty"],
    netCost: json["net_cost"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "product": product?.toJson(),
    "qty": qty,
    "net_cost": netCost,
    "total": total,
  };
}

class Product {
  int? id;
  String? title;
  String? image;
  String? details;
  double? price;
  String? unit;
  bool? isOffer;
  String? offerType;
  num? offerValue;
  DateTime? offerStartDate;
  DateTime? offerEndDate;
  num? oldPrice;
  bool? isFavorite;
  bool? isAvailable;

  Product({
    this.id,
    this.title,
    this.image,
    this.details,
    this.price,
    this.unit,
    this.isOffer,
    this.offerType,
    this.offerValue,
    this.offerStartDate,
    this.offerEndDate,
    this.oldPrice,
    this.isFavorite,
    this.isAvailable,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    details: json["details"],
    price: json["price"]?.toDouble(),
    unit: json["unit"],
    isOffer: json["is_offer"],
    offerType: json["offer_type"],
    offerValue: json["offer_value"],
    offerStartDate: json["offer_start_date"] == null ? null : DateTime.parse(json["offer_start_date"]),
    offerEndDate: json["offer_end_date"] == null ? null : DateTime.parse(json["offer_end_date"]),
    oldPrice: json["old_price"],
    isFavorite: json["is_favorite"],
    isAvailable: json["is_available"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "details": details,
    "price": price,
    "unit": unit,
    "is_offer": isOffer,
    "offer_type": offerType,
    "offer_value": offerValue,
    "offer_start_date": "${offerStartDate!.year.toString().padLeft(4, '0')}-${offerStartDate!.month.toString().padLeft(2, '0')}-${offerStartDate!.day.toString().padLeft(2, '0')}",
    "offer_end_date": "${offerEndDate!.year.toString().padLeft(4, '0')}-${offerEndDate!.month.toString().padLeft(2, '0')}-${offerEndDate!.day.toString().padLeft(2, '0')}",
    "old_price": oldPrice,
    "is_favorite": isFavorite,
    "is_available": isAvailable,
  };
}

class DataUser {
  UserUser? user;

  DataUser({
    this.user,
  });

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
    user: json["user"] == null ? null : UserUser.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
  };
}

class UserUser {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneCode;
  String? phone;
  String? image;
  num? points;
  String? invitationCode;
  int? cityId;
  dynamic city;

  UserUser({
    this.id,
    this.firstName,
    this.lastName,
    this.phoneCode,
    this.phone,
    this.image,
    this.points,
    this.invitationCode,
    this.cityId,
    this.city,
  });

  factory UserUser.fromJson(Map<String, dynamic> json) => UserUser(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    phoneCode: json["phone_code"],
    phone: json["phone"],
    image: json["image"],
    points: json["points"],
    invitationCode: json["invitation_code"],
    cityId: json["city_id"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "phone_code": phoneCode,
    "phone": phone,
    "image": image,
    "points": points,
    "invitation_code": invitationCode,
    "city_id": cityId,
    "city": city,
  };
}
