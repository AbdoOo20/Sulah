import 'package:dio/dio.dart';
import 'package:khedmaty/presentation/modules/auth/login/login.dart';

import '../../../../core/routing/route.dart';
import '../../../model/response/base/error_response.dart';

class ApiErrorHandler {
  static dynamic getMessage(error) {
    dynamic errorDescription = "";
    if (error is Exception) {
      try {
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
            // errorDescription = "Request to API server was cancelled";
              errorDescription = "تم إلغاء الطلب إلى بالانترنت";
              break;
            case DioErrorType.connectTimeout:
            // errorDescription = "Connection timeout with API server";
              errorDescription = "انتهت مهلة الاتصال بالانترنت";
              break;
            case DioErrorType.other:
              errorDescription =
              // "Connection to API server failed due to internet connection";
              "فشل الاتصال بالإنترنت";
              break;
            case DioErrorType.receiveTimeout:
              errorDescription =
              // "Receive timeout in connection with API server";
              "تم انتهاء مده الاتصال برجاء اعاده المحاولة";
              break;
            case DioErrorType.response:
              switch (error.response?.statusCode) {
                case 401:
                  errorDescription = "يجب تسجيل الدخول او انشاء حساب.";
                  pushAndRemoveUntil(const Login()) ;
                  break;
                case 404:
                case 500:
                case 503:
                // errorDescription = "There is a problem with the server";
                  errorDescription = " برحاء التاكد من الإتصال بالإنترنت ...";
                  // errorDescription = error.response?.statusMessage;
                  break;
                case 422:
                  Error422Response error422Response = Error422Response.fromJson(error.response?.data);
                  // if (error422Response.data != null) {
                  errorDescription = error422Response.message.toString();
                  // }else{
                  //   errorDescription =
                  //   "Failed to handel error - status code: ${error.response?.statusCode}";}
                  break;
                case 401:
                  Error422Response error422Response = Error422Response.fromJson(error.response?.data);
                  if (error422Response.code ==401) {
                    errorDescription = error422Response.message;
                    pushAndRemoveUntil(const Login());
                  }else{
                    errorDescription =
                    "Failed to handel error - status code: ${error.response?.statusCode}";}
                  break;
                default:
                  ErrorResponse errorResponse = ErrorResponse.fromJson(error.response?.data);
                  if (errorResponse.errors != null &&
                      errorResponse.errors!.length > 0)
                    errorDescription = errorResponse;
                  else
                    errorDescription =
                    "Failed to load data - status code: ${error.response?.statusCode}";
              }
              break;
            case DioErrorType.sendTimeout:
            // errorDescription = "Send timeout with server";
              errorDescription = "تم انتهاء مده الاتصال برجاء اعاده المحاولة";
              break;
          }
        } else {
          errorDescription = "Unexpected error occured";
        }
      } on FormatException catch (e) {
        errorDescription = e.toString();
      }
    } else {
      errorDescription = "is not a subtype of exception";
    }
    return errorDescription;
  }
}
