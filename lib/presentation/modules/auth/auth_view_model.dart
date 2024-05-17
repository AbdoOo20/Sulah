import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/resources/locale_keys.g.dart';
import 'package:khedmaty/core/routing/route.dart';
import 'package:khedmaty/injection.dart';
import 'package:khedmaty/presentation/modules/auth/register/register.dart';
import 'package:khedmaty/presentation/modules/splash/splash.dart';
import '../../../../core/api_checker.dart';
import '../../../../data/model/body/LoginBody.dart';
import '../../../../data/model/response/base/api_response.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../../../data/repository/auth_repo.dart';
import '../../../core/utils/showToast.dart';
import '../../../data/model/body/register_body.dart';
import '../../../data/model/body/update_profile_body.dart';
import '../../../data/model/response/base/emptyDataModel.dart';
import '../../../data/model/response/send_code_model.dart';
import '../../../data/model/response/user_model.dart';
import '../layout/ButtonNavBar.dart';
import 'confirm_code/verification_code/confirm_code_sheet.dart';

class AuthViewModel with ChangeNotifier {
  AuthRepo authRepo = getIt();
  SaveUserData saveUserData = getIt();

  AuthViewModel();

  ///variables
  bool _isLoading = false;
  bool _loading = false;
  String? _validationMSG;
  String _phoneCode = '+966';
  UserModel? _userModel;
  EmptyDataModel? _emptyDataModel;
  SendCodeModel? _sendCodeModel;
  bool _isClicked = false;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ///getters
  bool get isLoading => _isLoading;

  bool get loading => _loading;

  SendCodeModel? get sendCodeModel => _sendCodeModel;

  String? get validationMSG => _validationMSG;

  String get phoneCode => _phoneCode;

  bool get isClicked => _isClicked;

  ///setters

  UserModel? get userModel => _userModel;

  set validationMsg(String msg) {
    _validationMSG = msg;
    notifyListeners();
  }

  set phoneCodeCountry(String phoneCode) {
    _phoneCode = phoneCode;
    notifyListeners();
  }

  bool isClickedAction() {
    notifyListeners();
    return _isClicked = !_isClicked;
  }

  String removeLeadingZeroFromString(String input) {
    if (input.isEmpty) {
      return input;
    }
    if (input[0] == '0') {
      input = input.substring(1);
    }
    return input;
  }

  ///calling APIs Functions
  Future<ApiResponse> login(
      {required String phone, required BuildContext context}) async {
    _isLoading = true;
    notifyListeners();
    // String modifiedPhone = removeLeadingZeroFromString(phone);
    notifyListeners();
    final LoginBody body = LoginBody(phone: phone);
    ApiResponse responseModel = await authRepo.loginRepo(body);

    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _userModel = UserModel.fromJson(responseModel.response?.data);
      print('sssssssssss1');
      saveUserData.saveUserData(_userModel!);
      saveUserData.saveUserToken(_userModel?.data?.token ?? '');
      phoneController.text = '';
      ToastUtils.showToast(LocaleKeys.loggedInSuccessfully.tr());
      pushAndRemoveUntil(const CustomBottomNavigationBar(0));
      // if (_userModel?.code == 401) {
      //   print('sssssssssss2');
      //   ToastUtils.showToast(LocaleKeys.phoneNotRegistered.tr());
      //   //push(Register(phoneCode: phoneCode, phone: phone));
      // } else if (_userModel?.code == 200) {
      //   if (_userModel?.data != null) {
      //
      //   }
      // }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ApiResponse> register(
      BuildContext context, RegisterBody? registerBody) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await authRepo.registerRepo(registerBody);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _userModel = UserModel.fromJson(responseModel.response?.data);

      if (_userModel != null && _userModel?.code == 200) {
        if (_userModel?.data != null) {
          saveUserData.saveUserData(_userModel!);
          saveUserData.saveUserToken(_userModel?.data?.token ?? '');
        }
        ToastUtils.showToast(LocaleKeys.successfullyRegistered.tr());
        pushAndRemoveUntil(const CustomBottomNavigationBar(0));
      }
    } else {
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ApiResponse> updateProfile(
      BuildContext context, UpdateProfileBody? updateProfileBody) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await authRepo.updateProfile(updateProfileBody);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _userModel = UserModel.fromJson(responseModel.response?.data);
      if (_userModel != null && _userModel?.code == 200) {
        if (_userModel?.data?.id != null) {
          await saveUserData.saveUserData(_userModel!);
          await saveUserData.saveUserToken(_userModel?.data?.token ?? '');
          await saveUserData.saveUserToken(_userModel?.data?.token ?? '');
        }
        ToastUtils.showToast('YourInformationSuccessfullyModified'.tr());
        Navigator.pop(context);
      } else {
        ToastUtils.showToast(_userModel?.message ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ApiResponse> logout(
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await authRepo.logout();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _emptyDataModel = EmptyDataModel.fromJson(responseModel.response?.data);

      if (_emptyDataModel?.code == 200) {
        await saveUserData
            .clearSharedData()
            .then((value) => pushAndRemoveUntil(const Splash()));
      } else {
        ToastUtils.showToast(_emptyDataModel?.message ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ApiResponse> deleteAccount(
    BuildContext context,
  ) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await authRepo.deleteAccount();
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _emptyDataModel = EmptyDataModel.fromJson(responseModel.response?.data);
      if (_emptyDataModel?.code == 200) {
        await saveUserData
            .clearSharedData()
            .then((value) => pushAndRemoveUntil(const Splash()));
      } else {
        ToastUtils.showToast(_emptyDataModel?.message ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<bool> sendOTPFirebase(BuildContext context, String phone) async {
    String modifiedPhone = removeLeadingZeroFromString(phone);
    _loading = true;
    notifyListeners();
    bool successfully = false;
    ApiResponse responseModel =
        await authRepo.sendCode(_phoneCode, modifiedPhone);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _sendCodeModel = SendCodeModel.fromJson(responseModel.response?.data);
      if (_sendCodeModel != null && _sendCodeModel?.code == 200) {
        if (kDebugMode) {
          print(_sendCodeModel?.data?.code?.toString());
        }
        successfully = true;
        _loading = false;
        notifyListeners();
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) =>
              ConfirmCodeSheet(phone: modifiedPhone),
        );
      }
    } else {
      ApiChecker.checkApi(context, responseModel);
    }
    _loading = false;
    notifyListeners();
    return successfully;
  }

  Future<bool> verifyOTPFirebase(
      String smsCode, String phone, BuildContext context) async {
    String modifiedPhone = removeLeadingZeroFromString(phone);
    _isLoading = true;
    notifyListeners();
    try {
      ApiResponse responseModel =
          await authRepo.confirmCode(_phoneCode, modifiedPhone, smsCode);
      if (responseModel.response != null &&
          responseModel.response?.statusCode == 200) {
        _emptyDataModel = EmptyDataModel.fromJson(responseModel.response?.data);

        await login(phone: modifiedPhone, context: context);
      } else {
        ApiChecker.checkApi(context, responseModel);
      }
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      ToastUtils.showToast(LocaleKeys.codeIsWrong.tr());
      notifyListeners();
      return false;
    }
  }
}
