// import 'package:dio/dio.dart';
// import '../app_urls/app_url.dart';
// import '../datasource/remote/dio/dio_client.dart';
// import '../datasource/remote/exception/api_error_handler.dart';
// import '../model/response/base/api_response.dart';
//
// class SavesRepo {
//   final DioClient dioClient;
//
//   SavesRepo({required this.dioClient});
//
//   Future<ApiResponse> categoriesRepo(String storeId) async {
//     try {
//       Response response = await dioClient.get('${AppURL.kCategoriesURI}?store_id=${storeId}');
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//     }
//   }
//   Future<ApiResponse> storesRepo(String departmentId,title) async {
//     try {
//       Response response = await dioClient.get('${AppURL.kStoresURI}?department_id=${departmentId??""}&title=${title ?? ""}');
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//     }
//   }
// }