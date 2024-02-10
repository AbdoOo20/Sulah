import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../app_urls/app_url.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/body/LoginBody.dart';
import '../model/body/register_body.dart';
import '../model/body/update_profile_body.dart';
import '../model/response/base/api_response.dart';
import 'SaveUserData.dart';

class AuthRepo {
  final DioClient dioClient;
  final SaveUserData saveUserData;

  AuthRepo({required this.dioClient, required this.saveUserData});

  Future<ApiResponse> loginRepo(LoginBody loginBody) async {
    TargetPlatform deviceType = getDeviceType();

    if (kDebugMode) {
      print('${loginBody.phone}');
    }
    try {
      Response response = await dioClient.post(
        AppURL.kLoginURI,
        data: FormData.fromMap({
          'phone':loginBody.phone,
          'register_from':deviceType
        }),
      );
      // saveUserData.userData(response);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> sendCode(String countryCode,String phone) async {
    try {
      Response response = await dioClient.post(
        AppURL.sendCodeURI,
        data: {"country_code": countryCode, "phone": phone},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> confirmCode(String countryCode,String phone,String code) async {
    try {
      Response response = await dioClient.post(
        AppURL.verificationCodeURI,
        data: {
          "country_code": countryCode,
          "code": code,
          "phone": phone},
      );
      // saveUserData.userData(response);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> registerRepo(RegisterBody? registerBody) async {
    TargetPlatform deviceType = getDeviceType();

    try {
      Response response = await dioClient.post(
        AppURL.kRegisterURI,
        data: FormData.fromMap({
          "name": '${registerBody?.firstName??''} ${registerBody?.lastName??''}',
          "country_code": registerBody?.phoneCode ?? '',
          "phone": registerBody?.phone,
          "register_from": deviceType.name.toLowerCase(),
          "logo": registerBody?.image == null ? null : await MultipartFile.fromFile(registerBody!.image!.path),
        }),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateProfile(
      UpdateProfileBody? updateProfileBody) async {
    try {
      Response response = await dioClient.post(
        AppURL.kUpdateProfileURI,
        data: FormData.fromMap({
          "name": '${updateProfileBody?.firstName ?? ' '} ${updateProfileBody?.lastName ?? ' '}',
          "logo": updateProfileBody?.image == null
              ? null
              : await MultipartFile.fromFile(updateProfileBody!.image!.path),
        }),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> logout() async {
    try {
      Response response = await dioClient.post(
        AppURL.kLogoutURI,
        data: FormData.fromMap({
          "token": saveUserData.getUserToken() ?? '',
        }),
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteAccount() async {
    try {
      Response response = await dioClient.delete(AppURL.kDeleteAccountURI);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> updateFCMToken({required String fcmToken}) async {
    try {
      TargetPlatform deviceType = getDeviceType();

      /// for software_type
      Response response =
          await dioClient.post(AppURL.kUpdateFCMTokenURI, queryParameters: {
        'token': fcmToken,
        'lang': saveUserData.getLang(),
        'type': deviceType.name.toLowerCase()
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  TargetPlatform getDeviceType() {
    /// for software_type
    return defaultTargetPlatform;
  }
}
