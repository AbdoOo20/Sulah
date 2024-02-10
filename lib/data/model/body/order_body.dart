
class OrderBody {
  int storeId;
  String address;
  double latitude;
  double longitude;
  String notes;
  String payType;
  String receiveType;
  List<ProductData> product;

  OrderBody({
    required this.storeId,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.notes,
    required this.payType,
    required this.receiveType,
    required this.product,
  });

  factory OrderBody.fromJson(Map<String, dynamic> json) => OrderBody(
    storeId: json["store_id"],
    address: json["address"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    notes: json["notes"],
    payType: json["payment_method"],
    receiveType: json["type"],
    product: List<ProductData>.from(json["product_list"].map((x) => ProductData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "store_id": storeId,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "notes": notes,
    "payment_method": payType,
    "type": receiveType,
    "product_list": List<dynamic>.from(product.map((x) => x.toJson())),
  };
}

class ProductData {
  int productId;
  int qty;

  ProductData({
    required this.productId,
    required this.qty,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
    productId: json["product_id"],
    qty: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "amount": qty,
  };
}
