import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/routing/route.dart';
import '../../core/utils/app_constants.dart';
import '../../presentation/modules/splash/splash.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../model/response/user_model.dart';

class SaveUserData {
  final SharedPreferences sharedPreferences;
  final DioClient dioClient;

  SaveUserData({required this.sharedPreferences, required this.dioClient});

  /// save SharedData

  Future<void> saveUserData(UserModel userData) async {
    dioClient.updateHeader(userData.data?.token ?? "");
    String userSavedData = json.encode(userData);
    try {
      await sharedPreferences.setString(AppConstants.userData, userSavedData);
    } catch (e) {
      rethrow;
    }
  }
  Future<void> saveLang(String lang) async {
    try {
      await sharedPreferences.setString(AppConstants.lang, lang);
    } catch (e) {
      throw e;
    }
  }
  Future<void> saveUserToken(String userTOKEN) async {
    dioClient.updateHeader(userTOKEN);
    try {
      await sharedPreferences.setString(AppConstants.userTOKEN, userTOKEN);
    } catch (e) {
      throw e;
    }
  }
  Future<void> saveIsShowIntro(bool isShowIntro) async {
    try {
      await sharedPreferences.setBool(AppConstants.isShowIntro, isShowIntro);
    } catch (e) {
      throw e;
    }
  }
  Future<void> saveLatitude(double latitude) async {
    try {
      await sharedPreferences.setDouble(AppConstants.latitude, latitude);
    } catch (e) {
      throw e;
    }
  }
  Future<void> saveLongitude(double longitude) async {
    try {
      await sharedPreferences.setDouble(AppConstants.longitude, longitude);
    } catch (e) {
      throw e;
    }
  }
  Future<void> saveDistance(String distance) async {
    try {
      await sharedPreferences.setString(AppConstants.distance, distance);
    } catch (e) {
      throw e;
    }
  }
  Future<void> saveStoreId(String storeId) async {
    try {
      await sharedPreferences.setString(AppConstants.storeId, storeId);
    } catch (e) {
      throw e;
    }
  }

  ///get SharedData
  UserModel? getUserData()   {
    String?  userSavedData= sharedPreferences.getString(AppConstants.userData) ;
   if (userSavedData !=null) {
     Map<String, dynamic> userData = json.decode(userSavedData);
     UserModel userModel = UserModel.fromJson(userData);
     return userModel;
   }
  }
  String getUserToken() {
    return sharedPreferences.getString(AppConstants.userTOKEN) ?? "";
  }
  String getLang() {
    return sharedPreferences.getString(AppConstants.lang) ?? "ar";
  }
  String getStoreId() {
    return sharedPreferences.getString(AppConstants.storeId) ??'';
  }
  double getLatitude() {
    return sharedPreferences.getDouble(AppConstants.latitude) ?? 0.0;
  }
  double getLongitude() {
    return sharedPreferences.getDouble(AppConstants.longitude) ?? 0.0;
  }
  String getDistance() {
    return sharedPreferences.getString(AppConstants.distance) ??'';
  }


/// check SharedData
  bool isShowIntro() {
    return sharedPreferences.containsKey(AppConstants.isShowIntro);
  }
  bool isSelectLocation() {
    return sharedPreferences.containsKey(AppConstants.latitude);
  }

  ///clear SharedData
  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(AppConstants.userData);
    await sharedPreferences.remove(AppConstants.userTOKEN);
    // await sharedPreferences.remove(AppConstants.isShowIntro);
    await sharedPreferences.remove(AppConstants.storeId);
    await sharedPreferences.remove(AppConstants.longitude);
    await sharedPreferences.remove(AppConstants.latitude);
    await sharedPreferences.remove(AppConstants.distance);
    pushAndRemoveUntil(const Splash());
    return true;
  }
}
