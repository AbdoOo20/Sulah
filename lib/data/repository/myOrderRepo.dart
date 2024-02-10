
import 'dart:io';

import 'package:dio/dio.dart';

import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class MyOrdersRepo {
  final DioClient dioClient;

  MyOrdersRepo({required this.dioClient});

  Future<ApiResponse> myOrdersRepo(String type) async {
    try {
      Response response = await dioClient
          .get("${AppURL.kMyOrder}?status=$type");

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> oneOrderRepo(String orderId) async {
    try {
      Response response = await dioClient
          .get("${AppURL.kMyOrder}/$orderId");

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> cancelOrderRepo(String orderId) async {
    try {
      Response response = await dioClient.put("${AppURL.kMyOrder}/$orderId");

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> rateRepo(String orderId,num rate,String text,String storeId  ) async {
    try {
      Response response = await dioClient
          .post(AppURL.kRatesStoreURL
          ,data: FormData.fromMap({
          "rate": rate,
          "comment": text,
          "to_user_id": storeId
          }),
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}