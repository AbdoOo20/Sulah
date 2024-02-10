import 'package:dio/dio.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class HomeRepo {
  final DioClient dioClient;

  HomeRepo({required this.dioClient});

  Future<ApiResponse> sliderHomeRepo() async {
    try {
      Response response = await dioClient.get(AppURL.kHomeSliderURI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> departmentsRepo() async {
    try {
      Response response = await dioClient.get(AppURL.kDepartmentsURI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> nearStoresRepo(String latitude,longitude,title) async {
    try {
      Response response = await dioClient.get("${AppURL.kNearStores}${latitude}&longitude=${longitude}&title=${title}");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> bestStoresRepo({String? title}) async {
    try {
      Response response = await dioClient.get('${AppURL.kBestStores}?name=$title');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> bestSellerRepo() async {
    try {
      Response response = await dioClient.get(AppURL.kBestSeller);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> notificationListRepo() async {
    try {
      Response response = await dioClient.get(AppURL.kGetNotificationsURI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}