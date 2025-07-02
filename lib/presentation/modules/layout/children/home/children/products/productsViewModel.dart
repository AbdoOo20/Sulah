
import 'package:flutter/material.dart';
import 'package:sulah/data/model/response/one_store_model.dart';
import 'package:sulah/data/model/response/store_rate_model.dart';
import 'package:sulah/data/repository/SaveUserData.dart';

import '../../../../../../../core/api_checker.dart';
import '../../../../../../../core/utils/showToast.dart';
import '../../../../../../../data/model/response/base/api_response.dart';
import '../../../../../../../data/model/response/brands_model.dart';
import '../../../../../../../data/model/response/cars_model.dart';
import '../../../../../../../data/model/response/departments_model.dart';
import '../../../../../../../data/model/response/one_product_model.dart';
import '../../../../../../../data/model/response/productsModel.dart';
import '../../../../../../../data/repository/products_Repo.dart';



class ProductsViewModel with ChangeNotifier {
  final ProductsRepo productsRepo;
  final SaveUserData saveUserData;

  ProductsViewModel({required this.saveUserData, required this.productsRepo});

  final TextEditingController searchController = TextEditingController();
  List<String> image = [];
  String? brandId;
  String? carId;
  String? manufactureYear;
  bool _isLoading = false;
  bool _isFavLoading = false;
  int _quantity = 0;
  BrandsModel? _brandsModel;
  CarsModel? _carsModel;
  StoreRateModel?_storeRateModel;
  CarsModel? get carsModel => _carsModel;

  BrandsModel? get brandsModel => _brandsModel;
  StoreRateModel? get storeRateModel=>_storeRateModel;
  int? year;
  CarModel ? carModel;
  BrandModel?brandModel;
  Departments?departments;

  bool get isLoading => _isLoading;

  bool get isFavLoading => _isFavLoading;

  int get quantity => _quantity;


  set quantity(int newQuantity) {
    _quantity = newQuantity;
    notifyListeners();
  }

  notify() {
    notifyListeners();
  }

  ///calling APIs Functions
  ProductsModel? _productsModel;
  ProductsModel? _similarProductsModel;
  OneStoreModel? _oneStoreModel;
  OneProductModel? _oneProductModel;

  ProductsModel? get productsModel => _productsModel;
  ProductsModel? get similarProductsModel => _similarProductsModel;

  OneStoreModel? get oneStoreModel => _oneStoreModel;

  OneProductModel? get oneProductModel => _oneProductModel;

  /// collect price
  num totalPrice = 0;

  collectTotalPrice(num productPrice, num quantity) {
    num price = 0;
    // num extrasPrice = 0;
    // for (int i = 0; i < extra.length; i++) {
    //   if(extra[i].isSelected ?? false){
    //     extrasPrice = (extrasPrice) + ((extra[i].price ?? 0.0) * quantity);
    //   }
    // }
    price = (productPrice * quantity);
    totalPrice = price;
  }

  Future<ApiResponse> getProducts(context, String? title, String? departmentId,
      String? storeId,) async {
    _productsModel = null;
    ApiResponse responseModel = await productsRepo.productItemRepo(
        title, departmentId=='0'?'':departmentId, storeId, brandModel?.id.toString() ?? '',
        carModel?.id.toString() ?? '', year==null?'':year.toString());
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _productsModel = ProductsModel.fromJson(responseModel.response?.data);
    } else {
      notifyListeners();
      ApiChecker.checkApi(context, responseModel);
    }
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> getSimilarProducts(context,String id) async {
    _similarProductsModel = null;
    ApiResponse responseModel = await productsRepo.getSimilarProductsRepo(id);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _similarProductsModel = ProductsModel.fromJson(responseModel.response?.data);
    } else {
      notifyListeners();
      ApiChecker.checkApi(context, responseModel);
    }
    notifyListeners();
    return responseModel;
  }

  // Future<ApiResponse> getOneStore(context, String storeId) async {
  //   _oneStoreModel = null;
  //   ApiResponse responseModel = await productsRepo.oneStoreRepo(storeId);
  //   if (responseModel.response != null &&
  //       responseModel.response?.statusCode == 200) {
  //     _oneStoreModel = OneStoreModel.fromJson(responseModel.response?.data);
  //     if (_oneStoreModel != null && _oneStoreModel?.code == 200) {} else {
  //       ToastUtils.showToast(_oneStoreModel?.message ?? "");
  //     }
  //   } else {
  //     notifyListeners();
  //     ApiChecker.checkApi(context, responseModel);
  //   }
  //   notifyListeners();
  //   return responseModel;
  // }

  Future<ApiResponse> getOneProduct(context, String productId) async {
    _oneProductModel = null;
    image = [];
    ApiResponse responseModel = await productsRepo.oneProductRepo(productId);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _oneProductModel = OneProductModel.fromJson(responseModel.response?.data);
      if (_oneProductModel != null && _oneProductModel?.code == 200) {
        if (_oneProductModel?.data?.mainImage != null) {
          image.add(_oneProductModel?.data?.mainImage ?? '');
          for (int i = 0; i <
              (_oneProductModel?.data?.images?.length ?? 0); i++) {
            image.add(_oneProductModel?.data?.images?[i].images ?? '');
          }
        }
      } else {
        ToastUtils.showToast(_oneProductModel?.message ?? "");
      }
    } else {
      notifyListeners();
      ApiChecker.checkApi(context, responseModel);
    }
    notifyListeners();
    return responseModel;
  }


  Future<ApiResponse> getBrands(BuildContext context) async {
    _brandsModel = null;
    ApiResponse apiResponse = await productsRepo.getBrandsRepo();
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      _brandsModel = BrandsModel.fromJson(apiResponse.response?.data);
    } else {
      if (context.mounted) ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
    return apiResponse;
  }

  Future<ApiResponse> getCars(BuildContext context) async {
    _carsModel = null;
    ApiResponse apiResponse = await productsRepo.getCarsRepo();
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      _carsModel = CarsModel.fromJson(apiResponse.response?.data);
    } else {
      if (context.mounted) ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
    return apiResponse;
  }
  Future<ApiResponse> getStoreRate(BuildContext context,String storeId) async {
    _storeRateModel = null;
    ApiResponse apiResponse = await productsRepo.getStoreRateRepo(storeId);
    if (apiResponse.response != null &&
        apiResponse.response?.statusCode == 200) {
      _storeRateModel = StoreRateModel.fromJson(apiResponse.response?.data);
    } else {
      if (context.mounted) ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
    return apiResponse;
  }

}