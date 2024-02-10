import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/data/repository/Setting_Repo.dart';
import 'package:khedmaty/data/repository/products_Repo.dart';
import 'package:provider/provider.dart';
import '../../../../../core/api_checker.dart';
import '../../../../../core/utils/showToast.dart';
import '../../../../../data/model/body/contactUsBody.dart';
import '../../../../../data/model/response/MyFavorite_product_model.dart';
import '../../../../../data/model/response/base/api_response.dart';
import '../../../../../data/model/response/base/emptyDataModel.dart';
import '../../../../../data/model/response/myFavorite_store_model.dart';
import '../../../../../data/model/response/setting_model.dart';
import '../../../../../data/repository/SaveUserData.dart';

import '../home/homeViewModel.dart';

class SettingViewModel with ChangeNotifier {
  final SaveUserData saveUserData;
  final SettingRepo settingRepo;

  final ProductsRepo productsRepo;

  SettingViewModel(
      {required this.saveUserData,
        required this.productsRepo,
        required this.settingRepo});

  ///variables
  MyFavoriteStoreModel? _myFavoriteStoreModel;
  MyFavoriteProductModel? _myFavoriteProductModel;
  EmptyDataModel? _emptyDataModel;
  SettingModel? _settingModel;
  // PointsModel? _pointsModel;
  int? _historyIndex;

  bool _isLoading = false;
  bool _isFavLoading = false;

  /// getter
  MyFavoriteStoreModel? get myFavoriteStoreModel => _myFavoriteStoreModel;
  MyFavoriteProductModel? get myFavoriteProductModel => _myFavoriteProductModel;
  int? get historyIndex => _historyIndex;

  SettingModel? get settingModel => _settingModel;

  // PointsModel? get pointsModel => _pointsModel;

  bool get isLoading => _isLoading;
  bool get isFavLoading => _isFavLoading;
  set historyIndex (index){
    _historyIndex=index;
  }
  Future<ApiResponse> getMyFavoriteItem(BuildContext context,int position) async {
    ApiResponse apiResponse = await settingRepo.myFavoriteRepo(position);
    if (apiResponse.response != null && apiResponse.response?.statusCode == 200) {
      if(position==0){
        _myFavoriteStoreModel = MyFavoriteStoreModel.fromJson(apiResponse.response?.data);
      }else{
        _myFavoriteProductModel = MyFavoriteProductModel.fromJson(apiResponse.response?.data);
      }
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
    return apiResponse;
  }

  Future<ApiResponse> addFavoriteProduct(context, String productId, int productIndex,String? whichScreen,) async {
    _isLoading = true;
    ApiResponse responseModel = await settingRepo.addFavoriteProductRepo(productId);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      print("llllll${_myFavoriteStoreModel?.data?[productIndex].isSaved}");
      print("llllll${_myFavoriteStoreModel?.data?[productIndex].id}");

      if (_myFavoriteStoreModel != null && _myFavoriteStoreModel?.code == 200) {
        (_myFavoriteStoreModel?.data?[productIndex].isSaved == 0) ?
        (_myFavoriteStoreModel?.data?[productIndex].isSaved = 1) :
        (_myFavoriteStoreModel?.data?[productIndex].isSaved = 0);
        getMyFavoriteItem(context,1);
        _isLoading = false;
        print("llllll${_myFavoriteStoreModel?.data?[productIndex].isSaved}");

      } else {
        ToastUtils.showToast(_myFavoriteStoreModel?.message ?? "");
      }
    } else {
      ApiChecker.checkApi(context, responseModel);
      _isLoading = false;
    }
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> addStoreFavorite(BuildContext context,String id) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await productsRepo.savesStoreRepo(id);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
     await getMyFavoriteItem(context, 0);
    } else {
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ApiResponse> contactUsApi(context, ContactUsBody contactUsBody) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await settingRepo.contactUs(contactUsBody);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _emptyDataModel = EmptyDataModel.fromJson(responseModel.response?.data);
      if ( _emptyDataModel?.code == 200) {
        ToastUtils.showToast(_emptyDataModel?.message??'');
        Navigator.pop(context);
      }else{
        ToastUtils.showToast(_emptyDataModel?.message??'');
      }
    } else {
      notifyListeners();
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  Future<ApiResponse> setting(BuildContext context) async {
    ApiResponse apiResponse = await settingRepo.settingRepo();
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      _settingModel = SettingModel.fromJson(apiResponse.response?.data);
      if (_emptyDataModel?.code == 200) {
        _settingModel = SettingModel.fromJson(apiResponse.response?.data);
      } else {
        // ToastUtils.showToast(_emptyDataModel?.message ?? "");
      }
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
    return apiResponse;
  }

  // Future<ApiResponse> points(BuildContext context) async {
  //   ApiResponse apiResponse = await settingRepo.pointsRepo();
  //   if (apiResponse.response != null &&
  //       apiResponse.response?.statusCode == 200) {
  //     _emptyDataModel = EmptyDataModel.fromJson(apiResponse.response?.data);
  //     if (_emptyDataModel?.code == 200) {
  //       _pointsModel = PointsModel.fromJson(apiResponse.response?.data);
  //     } else {
  //       ToastUtils.showToast(_emptyDataModel?.message ?? "");
  //     }
  //   } else {
  //     ApiChecker.checkApi(context, apiResponse);
  //   }
  //   notifyListeners();
  //   return apiResponse;
  // }
}
