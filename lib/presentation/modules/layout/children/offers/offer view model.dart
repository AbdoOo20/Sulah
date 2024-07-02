import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/resources/locale_keys.g.dart';
import 'package:khedmaty/injection.dart';
import '../../../../../core/utils/showToast.dart';
import '../../../../../data/app_urls/app_url.dart';
import '../../../../../data/datasource/remote/dio/dio_client.dart';

class ProductOffer {
  late int id;
  late int productID;
  late int orderID;
  late int amount;
  late int price;
  late int totalPrice;
  late int totalAmount;
  late String title;
  late String image;
  late List<OfferOrder> offers;

  ProductOffer({
    required this.id,
    required this.productID,
    required this.orderID,
    required this.amount,
    required this.totalPrice,
    required this.totalAmount,
    required this.price,
    required this.title,
    required this.image,
    required this.offers,
  });

  ProductOffer.fromJson(Map<String, dynamic> json, bool isOffer) {
    id = json["id"];
    productID = json["product_id"];
    orderID = json["order_id"];
    amount = json["amount"];
    price = json["price"];
    totalPrice = isOffer ? 0 : json["total_price"];
    totalAmount = isOffer ? 0 : json["total_amount"];
    title = isOffer ? json['product']['title'] : json["title"];
    image = isOffer
        ? "https://sulah.sa/storage/${json['product']['main_image']}"
        : json["image"];
    if (isOffer && json['offerorders'] != null) {
      offers = <OfferOrder>[];
      json['offerorders'].forEach((v) {
        offers.add(OfferOrder.fromJson(v));
      });
    }
  }
}

class OfferOrder {
  late int id;
  late int price;
  late int storeID;
  late String status;
  late String payment;

  OfferOrder({
    required this.id,
    required this.price,
    required this.storeID,
    required this.status,
    required this.payment,
  });

  factory OfferOrder.fromJson(Map<String, dynamic> json) => OfferOrder(
        id: json["id"],
        price: json["price"],
        storeID: json["store_id"],
        status: json["status"],
        payment: json["payment_status"],
      );
}

class OfferProvider with ChangeNotifier {
  bool isLoading = false;
  late DioClient dioClient;
  List<ProductOffer> products = [];
  List<ProductOffer> offers = [];
  TextEditingController priceController = TextEditingController();

  Future<void> getMyOrders(BuildContext context) async {
    isLoading = true;
    products = [];
    offers = [];
    dioClient = getIt();
    Response response = await dioClient.get("${AppURL.kOffer}");
    if (response.statusCode == 200) {
      response.data['data']['products'].forEach((e) {
        products.add(ProductOffer.fromJson(e, false));
      });
      response.data['data']['myoffers'].forEach((e) {
        offers.add(ProductOffer.fromJson(e, true));
      });
    } else {
      isLoading = false;
      ToastUtils.showToast(response.data['message']);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> addOffer(
    int price,
    int orderID,
    int productId,
    int amount,
  ) async {
    log(price.toString());
    dioClient = getIt();
    Map<String, dynamic> data = {
      'price': price,
      'amount': amount,
      'order_id': orderID,
      'product_id': productId,
    };
    Response response = await dioClient.post(
      "${AppURL.kAddOffer}",
      data: data,
    );
    if (response.statusCode == 200) {
      ToastUtils.showToast(LocaleKeys.addedSuccessfully.tr());
      priceController.clear();
      notifyListeners();
    } else {
      ToastUtils.showToast(response.data['message']);
      priceController.clear();
      notifyListeners();
    }
  }

  Future<void> deleteOffer(int offerID, BuildContext context) async {
    ToastUtils.showToast(LocaleKeys.wait.tr());
    dioClient = getIt();
    Response response =
        await dioClient.delete("${AppURL.kDeleteOffer}$offerID");
    if (response.statusCode == 200) {
      ToastUtils.showToast(LocaleKeys.deleteDone.tr());
      await getMyOrders(context);
    } else {
      ToastUtils.showToast(response.data['message']);
      notifyListeners();
    }
  }

  Future<void> acceptOrRejectOffer(
      String status, int id, BuildContext context) async {
    dioClient = getIt();
    ToastUtils.showToast(LocaleKeys.wait.tr());
    isLoading = true;
    notifyListeners();
    Map<String, dynamic> data = {
      'status': status,
      'id': id,
    };
    Response response = await dioClient.put(
      "${AppURL.kAcceptRejectOffer}",
      data: data,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      priceController.clear();
      isLoading = false;
      notifyListeners();
      getMyOrders(context);
    } else {
      ToastUtils.showToast(response.data['message']);
      priceController.clear();
      isLoading = false;
      notifyListeners();
    }
  }
}
