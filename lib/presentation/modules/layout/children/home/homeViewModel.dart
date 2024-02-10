import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/data/model/response/branchesModel.dart';
import 'package:khedmaty/data/model/response/departments_model.dart';
import 'package:khedmaty/data/model/response/nearest_stores_model.dart';
import 'package:khedmaty/data/model/response/nearBranchModel.dart';
import 'package:khedmaty/data/model/response/productsModel.dart';
import 'package:khedmaty/data/model/response/storesModel.dart';
import 'package:khedmaty/data/repository/home_Repo.dart';
import 'package:khedmaty/data/repository/products_Repo.dart';
import '../../../../../core/api_checker.dart';
import '../../../../../data/model/response/base/api_response.dart';
import '../../../../../data/model/response/notificationModel.dart';
import '../../../../../data/model/response/sliders_model.dart';
import '../../../../../data/repository/SaveUserData.dart';

class HomeViewModel with ChangeNotifier {
  final HomeRepo homeRepo;
  final ProductsRepo productsRepo;
  final SaveUserData saveUserData;

  HomeViewModel(
      {required this.productsRepo,
        required this.saveUserData,
        required this.homeRepo});

  ///variables
  NotificationModel? _notificationModel;
  SlidersModel? _sliderModel;
  BranchesModel? _branchesModel;
  StoresModel? _bestStoresModel;
  NearBranchModel? _nearBranchModel;
  DepartmentsModel? _departmentsModel;
  NearestStoresModel? _nearestStoresModel;
  ProductsModel? _bestSellerModel;

  bool _isLoading = false;

  int? _isSelect;
  ///list of category
  int? _isSelectCat;
  String? _catIdSelected;
  int? get isSelectCat => _isSelectCat;
  String? get catIdSelected => _catIdSelected;
  set isSelectCat(int? index){_isSelectCat=index;notifyListeners();}
  set catIdSelect(String? catId){_catIdSelected=catId;notifyListeners();}
  List<Departments> _categoriesList = [];
  List<Departments> get categoriesList => _categoriesList;
  /// getter
  NotificationModel? get notificationModel => _notificationModel;
  SlidersModel? get sliderModel => _sliderModel;
  ProductsModel? get bestSellerModel => _bestSellerModel;
  BranchesModel? get branchesModel => _branchesModel;
  StoresModel? get bestStoresModel => _bestStoresModel;

  NearBranchModel? get nearBranchModel => _nearBranchModel;
  DepartmentsModel? get departmentsModel => _departmentsModel;

  NearestStoresModel? get nearestStoresModel => _nearestStoresModel;

  bool get isLoading => _isLoading;
  int? get isSelect => _isSelect;

  ///setters
  set isSelect(int? index){_isSelect=index;notifyListeners();}
  Future<ApiResponse> getSliderImages(BuildContext context,) async {
    _sliderModel=null;
    ApiResponse apiResponse = await homeRepo.sliderHomeRepo();
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      _sliderModel = SlidersModel.fromJson(apiResponse.response?.data);
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
    return apiResponse;
  }
  Future<ApiResponse> getDepartments(BuildContext context,) async {
    _departmentsModel=null;
    ApiResponse apiResponse = await homeRepo.departmentsRepo();
    if (apiResponse.response != null && apiResponse.response?.statusCode == 200) {
      _departmentsModel = DepartmentsModel.fromJson(apiResponse.response?.data);
      if(_departmentsModel != null && _departmentsModel?.code == 200){
        _categoriesList.clear();
        _categoriesList.add(Departments(id: 0,title: "all".tr(),image:'all'));
        apiResponse.response?.data["data"].forEach((department) => _categoriesList.add(Departments.fromJson(department)));
        _isSelectCat = 0;
      }
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
    return apiResponse;
  }
  Future<ApiResponse> getNearStores(BuildContext context,String title) async {
    _nearestStoresModel =null;
    ApiResponse apiResponse = await homeRepo.nearStoresRepo( saveUserData.getLatitude().toString(),saveUserData.getLongitude().toString(),title);
    if (apiResponse.response != null && apiResponse.response?.statusCode == 200) {
      _nearestStoresModel = NearestStoresModel.fromJson(apiResponse.response?.data);
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
    return apiResponse;
  }

  Future<ApiResponse> getBestStores(BuildContext context, {String? title}) async {
    _bestStoresModel=null;
    ApiResponse apiResponse = await homeRepo.bestStoresRepo(title: title??'');
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      _bestStoresModel = StoresModel.fromJson(apiResponse.response?.data);
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
    return apiResponse;
  }
  Future<ApiResponse> getBestSeller(BuildContext context) async {
    _bestSellerModel =null;
    ApiResponse apiResponse = await homeRepo.bestSellerRepo();
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      _bestSellerModel = ProductsModel.fromJson(apiResponse.response?.data);
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
    return apiResponse;
  }
  Future<ApiResponse> getNotificationCount(BuildContext context,) async {
    ApiResponse apiResponse = await homeRepo.sliderHomeRepo();
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {

    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
    return apiResponse;
  }

  // Future<ApiResponse> isFavorite(
  //     context, String productId, int productIndex,String? whichScreen) async {
  //   _isLoading = true;
  //   ApiResponse responseModel = await productsRepo.isFavoriteRepo(productId);
  //   if (responseModel.response != null &&
  //       responseModel.response?.statusCode == 200) {
  //     if(whichScreen == "fav"){/// fav , products , latestPro
  //       Provider.of<SettingViewModel>(context, listen: false).getMyFavoriteItem(context);
  //     }else if(whichScreen == "products"){
  //       Provider.of<ProductsViewModel>(context, listen: false).changeFaveAsIndex(productIndex);
  //     }else if(whichScreen == "latestPro"){
  //       _latestProductsModel?.data?[productIndex].isFavorite == false
  //           ? _latestProductsModel?.data![productIndex].isFavorite = true
  //           : _latestProductsModel?.data![productIndex].isFavorite = false;
  //     }
  //     notifyListeners();
  //     _isLoading = false;
  //   } else {
  //     ApiChecker.checkApi(context, responseModel);
  //     _isLoading = false;
  //   }
  //   notifyListeners();
  //   return responseModel;
  // }

  // changeFaveAsIndex(int productIndex){
  //   if( _nearestStoresModel != null){
  //     print(",,,,,,${ _nearestStoresModel?.data?[productIndex].isFavorite}");
  //     _nearestStoresModel?.data?[productIndex].isFavorite == false
  //         ? _nearestStoresModel?.data![productIndex].isFavorite = true
  //         : _nearestStoresModel?.data![productIndex].isFavorite = false;
  //     print(",,,,,,${ _nearestStoresModel?.data?[productIndex].isFavorite}");
  //     notifyListeners();
  //   }
  // }

  Future<ApiResponse> getNotification(BuildContext context) async {
    _isLoading=true;
    notifyListeners();
    ApiResponse apiResponse = await homeRepo.notificationListRepo();
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      _notificationModel = NotificationModel.fromJson(apiResponse.response?.data);
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    _isLoading=false;
    notifyListeners();
    return apiResponse;
  }
  refreshData(){
    notifyListeners();
  }
}
