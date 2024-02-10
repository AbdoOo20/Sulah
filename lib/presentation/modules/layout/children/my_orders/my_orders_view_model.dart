import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khedmaty/core/routing/route.dart';
import 'package:khedmaty/data/model/response/base/emptyDataModel.dart';
import 'package:khedmaty/presentation/modules/auth/login/login.dart';

import '../../../../../core/api_checker.dart';
import '../../../../../core/utils/showToast.dart';
import '../../../../../data/model/response/base/api_response.dart';
import '../../../../../data/model/response/myOrdersModel.dart';
import '../../../../../data/model/response/oneOrderModel.dart';
import '../../../../../data/repository/myOrderRepo.dart';


class MyOrdersViewModel with ChangeNotifier {
  final MyOrdersRepo myOrdersRepo;

  MyOrdersViewModel({required this.myOrdersRepo});

  bool _isLoading = false;
  bool _rateLoading = false;

  bool get isLoading => _isLoading;
  bool get rateLoading => _rateLoading;
num rate =0;

  ///calling APIs Functions
  MyOrdersModel? _myOrdersModel;
  OneOrderModel? _oneOrderModel;
  EmptyDataModel? _emptyDataModel;


  MyOrdersModel? get myOrdersModel => _myOrdersModel;
  OneOrderModel? get oneOrderModel => _oneOrderModel;
  EmptyDataModel? get emptyDataModel => _emptyDataModel;


  MyOneOrderModel? _myOrderData;
  MyOneOrderModel? _oneOrder;
  MyOneOrderModel? get myOrderData => _myOrderData;
  MyOneOrderModel? get oneOrder => _oneOrder;


  Future<ApiResponse> getMyOrdersApi(BuildContext context, String type) async {
    _isLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await myOrdersRepo.myOrdersRepo(type);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _myOrdersModel = MyOrdersModel.fromJson(responseModel.response?.data);
      notifyListeners();
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> getOneOrderApi(BuildContext context, String orderId) async {
    _oneOrderModel = null;
    _isLoading = true;
    // notifyListeners();
    ApiResponse responseModel = await myOrdersRepo.oneOrderRepo(orderId);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {

      _isLoading = false;
      _oneOrderModel = OneOrderModel.fromJson(responseModel.response?.data);
      notifyListeners();
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> cancelOneOrderApi(BuildContext context, String orderId) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse responseModel = await myOrdersRepo.cancelOrderRepo(orderId);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _isLoading = false;
      _emptyDataModel = EmptyDataModel.fromJson(responseModel.response?.data);
      if (_emptyDataModel?.code== 200) {
        getMyOrdersApi(context,'current');
      }
      else if (_emptyDataModel?.code== 430) {
        pushAndRemoveUntil(Login());
      }else{
        ToastUtils.showToast(_emptyDataModel?.message??'');
      }

      notifyListeners();
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    notifyListeners();
    return responseModel;
  }
  Future<ApiResponse> rateApi(BuildContext context, String orderId,String text,String storeId) async {
    _rateLoading = true;
    notifyListeners();
    ApiResponse responseModel = await myOrdersRepo.rateRepo(orderId,rate ,text,storeId);
    if (responseModel.response != null && responseModel.response?.statusCode == 200) {
      _emptyDataModel = EmptyDataModel.fromJson(responseModel.response?.data);
      if(_emptyDataModel?.code==200){
        getOneOrderApi( context,  orderId);
        Navigator.pop(context);

      }
      else{
        ToastUtils.showToast(_emptyDataModel?.message??'');
      }
    } else {
      ApiChecker.checkApi(context, responseModel);
    }
    _rateLoading = false;
    notifyListeners();
    return responseModel;
  }
}
