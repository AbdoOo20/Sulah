import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/routing/route.dart';
import 'package:khedmaty/injection.dart';
import 'package:khedmaty/presentation/modules/layout/children/home/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../../core/api_checker.dart';
import '../../../../../../../core/utils/showToast.dart';
import '../../../../../../../data/datasource/locale/database_model.dart';
import '../../../../../../../data/datasource/locale/database_provider.dart';
import '../../../../../../../data/model/body/order_body.dart';
import '../../../../../../../data/model/response/base/api_response.dart';
import '../../../../../../../data/model/response/calculate_order_cost_model.dart';
import '../../../../../../../data/model/response/orders_model.dart';
import '../../../../../../../data/repository/SaveUserData.dart';
import '../../../../../../../data/repository/orders_repo.dart';
import '../../../../ButtonNavBar.dart';
import '../../../my_orders/my_orders.dart';
import '../payment&DeliveryScreen/pay_web_view/pay_web_view.dart';

class ShoppingCaredViewModel with ChangeNotifier {
  final OrdersRepo ordersRepo;
  final SaveUserData saveUserData;

  ShoppingCaredViewModel(
      {required this.saveUserData, required this.ordersRepo});

  ///variables
  double? latitude;

  double? longitude;

  String? address;
  final bool _isClicked = false;
  bool _isLoading = false;
  bool _isPoints = false;
  String? _paymentType;

  OrdersModel? _ordersModel;
  CalculateOrderCostModel? _costModel;
  TextEditingController _noteController = TextEditingController();

  ///getters
  bool get isClicked => _isClicked;

  bool get isLoading => _isLoading;

  bool get isPoints => _isPoints;

  String? get paymentType => _paymentType;

  CalculateOrderCostModel? get costModel => _costModel;

  OrdersModel? get ordersModel => _ordersModel;

  TextEditingController? get noteController => _noteController;

  ///setters
  set noteControllerSet(TextEditingController notController) {
    _noteController = notController;
    notifyListeners();
  }

  set isPointsSet(bool isPoints) {
    _isPoints = isPoints;
    notifyListeners();
  }

  set paymentTypeSet(String paymentType) {
    _paymentType = paymentType;
    notifyListeners();
  }

  ///calling APIs Functions
  Future<ApiResponse> calculateOrderCost(
      {required BuildContext context, required bool isDelivery}) async {
    _isLoading = true;
    notifyListeners();
    var cartItems = Provider.of<CartProvider>(context, listen: false).cartItems;
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<ProductData> productList = [];
    for (var item in cartItems) {
      productList.add(ProductData(
        productId: item.id,
        qty: item.quantity,
      ));
    }
    OrderBody calculateOrderCost = OrderBody(
      storeId: cartItems[0].storeId,
      address: saveUserData.getDistance(),
      latitude: saveUserData.getLatitude(),
      longitude: saveUserData.getLongitude(),
      notes: noteController?.text ?? "",
      payType: _paymentType ?? "",
      receiveType: isDelivery ? "delivery" : "pickup_from_store",
      // shipping,store
      product: productList,
    );
    ApiResponse responseModel =
        await ordersRepo.calculateOrderCostRepo(calculateOrderCost);
    if (responseModel.response != null &&
        responseModel.response?.statusCode == 200) {
      _costModel =
          CalculateOrderCostModel.fromJson(responseModel.response?.data);
      if (_costModel?.code == 200) {
        noteController?.text = '';
        Provider.of<CartProvider>(context, listen: false).cartItems.clear();
        notifyListeners();
        pref.setString(
            "cart",
            cartItemsToJson(
                Provider.of<CartProvider>(context, listen: false).cartItems));
        if (_paymentType == 'mada') {
          push(PayWebViewScreen(
            id: responseModel.response!.data['data']['order']['id'],
            link: "https://sulah.sa/moyasar/",
          ));
        } else if (_paymentType == 'taby') {
          push(PayWebViewScreen(
            id: responseModel.response!.data['data']['order']['id'],
            link: "https://checkout.tabby.ai/?sessionId=64a9a922-f489-4baa-a021-794a754d13ea&apiKey=pk_test_fa724f4b-c616-464d-82f9-4d0d18bbbabc&product=installments&merchantCode=Seuolasau",
          ));
        } else {
          pushAndRemoveUntil(CustomBottomNavigationBar(0));
        }
        _paymentType = null;
        notifyListeners();
      } else {
        ToastUtils.showToast(_costModel?.message ?? "");
      }
    } else {
      _isLoading = false;
      ApiChecker.checkApi(context, responseModel);
    }
    _isLoading = false;
    notifyListeners();
    return responseModel;
  }

  refreshData() {
    notifyListeners();
  }

  saveData(String address, double lat, double lng) {
    saveUserData.saveDistance(address);
    saveUserData.saveLatitude(lat);
    saveUserData.saveLongitude(lng);
    notifyListeners();
  }
}
