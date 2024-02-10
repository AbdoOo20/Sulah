import 'dart:convert';

List<CartItems> cartItemsFromJson(String str) => List<CartItems>.from(json.decode(str).map((x) => CartItems.fromJson(x)));
String cartItemsToJson(List<CartItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartItems {
  int id;
  String image;
  String name;
  double price;
  int quantity;
  int storeId;
  String storeName;
  String storeImage;
  String orderStatus; // جاهز او غير جاهز    'ready', 'reserve'
  // int timePrepareProductAsMinutes; // وقت التحضير علي شكل دقايق
  // String timeType; //نوع الوقت ساعه او دقيقه
  // int timePrepareProduct; // وقت التحضير الفعلي للعرض
  // List<AdditionCart> additionsCart;

  CartItems({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.storeId,
    required this.storeName,
    required this.storeImage,
    required this.orderStatus,
    // required this.additionsCart,
  });

  factory CartItems.fromJson(Map<String, dynamic> json) => CartItems(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    price: json["price"],
    quantity: json["quantity"],
    storeId: json["storeId"],
    storeName: json["storeName"],
    storeImage: json["storeImage"],
    orderStatus: json["orderStatus"],
    // timePrepareProductAsMinutes: json["timePrepareProductAsMinutes"],
    // timeType: json["timeType"],
    // timePrepareProduct: json["timePrepareProduct"],
    // additionsCart: List<AdditionCart>.from(json["Additions"].map((x) => AdditionCart.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "name": name,
    "price": price,
    "quantity": quantity,
    "storeId": storeId,
    "storeName": storeName,
    "storeImage": storeImage,
    "orderStatus": orderStatus,
    // "timePrepareProductAsMinutes": timePrepareProductAsMinutes,
    // "timeType": timeType,
    // "timePrepareProduct": timePrepareProduct,
    // "Additions": List<dynamic>.from(additionsCart.map((x) => x.toJson())),
  };
}

class AdditionCart {
  int additionsId;
  String additionsName;
  num additionsPrice;

  AdditionCart({
    required this.additionsId,
    required this.additionsName,
    required this.additionsPrice,
  });

  factory AdditionCart.fromJson(Map<String, dynamic> json) => AdditionCart(
    additionsId: json["additionsId"],
    additionsName: json["additionsName"],
    additionsPrice: json["additionsPrice"],
  );

  Map<String, dynamic> toJson() => {
    "additionsId": additionsId,
    "additionsName": additionsName,
    "additionsPrice": additionsPrice,
  };
}
