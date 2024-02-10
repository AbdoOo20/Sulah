//
// import 'package:adhmn/core/routing/navigation_services.dart';
// import 'package:adhmn/core/routing/routes.dart';
// import 'package:adhmn/domain/provider/local_auth_provider.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../generated/locale_keys.g.dart';
// import 'base/simple_dialogs.dart';
//
// Future<bool?> showLogoutDialog(BuildContext context) async {
//
//   return await showQuestionDialog(
//     context,
//     btnTextPositive: tr(LocaleKeys.no),
//     btnTextNegative: tr(LocaleKeys.yes),
//     question: tr(LocaleKeys.wantToSignOut),
//     onNegativeClick: () async {
//       _onLogoutPress(context);
//     },
//     onPositiveClick: () {
//       //
//     },
//   );
// }
//
// _onLogoutPress(BuildContext context) {
//   Provider.of<LocalAuthProvider>(context, listen: false)
//       .logOut()
//       .then((isCleared) {
//     if (isCleared) {
//       Navigator.pop(context);
//       NavigationService.pushNamedAndRemoveUntil(Routes.loginScreen);
//     }
//   });
// }