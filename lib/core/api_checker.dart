import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/model/response/base/api_response.dart';
import 'package:provider/provider.dart';

import '../data/repository/SaveUserData.dart';
import 'utils/showToast.dart';


class ApiChecker {
  static void checkApi(BuildContext context, ApiResponse apiResponse) {
    print("ooooo____${apiResponse.error.toString()}");
    print("ooooo____${apiResponse.response?.statusCode}");
    // if(apiResponse.error is! String && apiResponse.error.errors[0].message == 'Unauthorized.') {
    if(apiResponse.response?.statusCode == 401) {
    // back to login and remove data
      Provider.of<SaveUserData>(context,listen: false).clearSharedData();
    }else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.message;
      }
      if (kDebugMode) {
        print(errorMessage);
      }
      ToastUtils.showToast(errorMessage??'');
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_errorMessage, style: TextStyle(color: Colors.white)), backgroundColor: Colors.red));
    }
  }
}