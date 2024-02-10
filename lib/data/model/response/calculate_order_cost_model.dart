class CalculateOrderCostModel {
  Data? data;
  String? message;
  int? code;

  CalculateOrderCostModel({
    this.data,
    this.message,
    this.code,
  });

  factory CalculateOrderCostModel.fromJson(Map<String, dynamic> json) => CalculateOrderCostModel(
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
  num? netTotal;
  num? taxValue;
  num? totalTax;
  num? driverCost;
  num? grandTotal;
  String? store;
  int? storeId;
  String? address;
  double? latitude;
  double? longitude;
  String? notes;
  String? payType;
  String? receiveType;
  bool? timeType;
  String? receiveDate;
  String? receiveTime;

  Data({
    this.netTotal,
    this.taxValue,
    this.totalTax,
    this.driverCost,
    this.grandTotal,
    this.store,
    this.storeId,
    this.address,
    this.latitude,
    this.longitude,
    this.notes,
    this.payType,
    this.receiveType,
    this.timeType,
    this.receiveDate,
    this.receiveTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    netTotal: json["net_total"],
    taxValue: json["tax_value"],
    totalTax: json["total_tax"],
    driverCost: json["driver_cost"]?.toDouble(),
    grandTotal: json["grand_total"]?.toDouble(),
    store: json["store"],
    storeId: json["store_id"],
    address: json["address"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    notes: json["notes"],
    payType: json["pay_type"],
    receiveType: json["receive_type"],
    timeType: json["time_type"],
    receiveDate: json["receive_date"],
    receiveTime: json["receive_time"],
  );

  Map<String, dynamic> toJson() => {
    "net_total": netTotal,
    "tax_value": taxValue,
    "total_tax": totalTax,
    "driver_cost": driverCost,
    "grand_total": grandTotal,
    "store": store,
    "store_id": storeId,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "notes": notes,
    "pay_type": payType,
    "receive_type": receiveType,
    "time_type": timeType,
    "receive_date": receiveDate,
    "receive_time": receiveTime,
  };
}
