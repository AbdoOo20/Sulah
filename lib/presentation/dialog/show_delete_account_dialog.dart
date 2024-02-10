//
// import 'package:adhmn/core/routing/navigation_services.dart';
// import 'package:adhmn/core/routing/routes.dart';
// import 'package:adhmn/data/model/base/response_model.dart';
// import 'package:adhmn/domain/provider/local_auth_provider.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../generated/locale_keys.g.dart';
// import 'base/simple_dialogs.dart';
//
// Future<bool?> showDeleteAccountDialog(BuildContext context) async {
//
//   return await showQuestionDialog(
//     context,
//     btnTextPositive: tr(LocaleKeys.no),
//     btnTextNegative: tr(LocaleKeys.yes),
//     question: tr(LocaleKeys.wantToDeleteAccount),
//     onNegativeClick: () async => _onPress(context),
//     onPositiveClick: () {
//       //
//     },
//   );
// }
//
// _onPress(BuildContext context)async {
//  ResponseModel responseModel= await Provider.of<LocalAuthProvider>(context, listen: false).deleteAccount();
//     if (responseModel.isSuccess) {
//       NavigationService.goBack();
//       NavigationService.pushNamedAndRemoveUntil(Routes.loginScreen);
//     }
//
// }