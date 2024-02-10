import 'package:dio/dio.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class ProductsRepo {
  final DioClient dioClient;

  ProductsRepo({required this.dioClient});

  Future<ApiResponse> productItemRepo(String? title ,String? departmentId,String? storeId,String? brandId,String? carId,String? manufactureYear,) async {
    try {
      Response response = await dioClient.get('${AppURL.kProductsURI}?title=$title&department_id[]=$departmentId&store_id=$storeId&brand_id[]=$brandId&car_id[]=$carId&manufacture_year[]=$manufactureYear');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  // Future<ApiResponse> oneStoreRepo(String storeId) async {
  //   try {
  //     Response response = await dioClient.get('${AppURL.kOneStoreURI}?store_id=${storeId}');
  //     return ApiResponse.withSuccess(response);
  //   } catch (e) {
  //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
  //   }
  // }
  Future<ApiResponse> getStoreRateRepo(String storeId) async {
    try {
      Response response = await dioClient.get('${AppURL.kStoreRatesURL}$storeId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> oneProductRepo(String productId) async {
    try {
      Response response = await dioClient.get('${AppURL.kOneProductURI}$productId');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getCarsRepo() async {
    try {
      Response response = await dioClient
          .get(AppURL.kCarsURL);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> getBrandsRepo() async {
    try {
      Response response = await dioClient
          .get(AppURL.kBrandsURL);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }  Future<ApiResponse> getSimilarProductsRepo(String id) async {
    try {
      Response response = await dioClient
          .get('${AppURL.kSimilarProductsURL}/$id');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> savesStoreRepo(String id) async {
    try {
      Response response = await dioClient.post(AppURL.kSavesURL,data: {'to_user_id':id});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}