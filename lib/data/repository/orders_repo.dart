import 'package:dio/dio.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/body/order_body.dart';
import '../model/response/base/api_response.dart';
import 'SaveUserData.dart';

class OrdersRepo {
  final DioClient dioClient;
  final SaveUserData saveUserData;
  OrdersRepo({required this.dioClient, required this.saveUserData});

  Future<ApiResponse>calculateOrderCostRepo(OrderBody orderBody) async {
    try {
      Response response = await dioClient.post(
        AppURL.kMyOrder,
        data: orderBody.toJson(),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
