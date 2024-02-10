//
// import 'package:adhmn/core/extensions/num_extensions.dart';
// import 'package:adhmn/core/res/text_styles.dart';
// import 'package:adhmn/core/resources/resources.dart';
// import 'package:adhmn/core/routing/navigation_services.dart';
// import 'package:adhmn/core/routing/routes.dart';
// import 'package:adhmn/generated/assets.dart';
// import 'package:adhmn/presentation/component/component.dart';
// import 'package:adhmn/presentation/modules/layout/children/my_requests/my_request_view_model.dart';
// import 'package:delivery_point_provider/core/extensions/num_extensions.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../core/resources/app_assets.dart';
// import '../../../core/resources/values_manager.dart';
// import '../../../generated/locale_keys.g.dart';
// import 'base/simple_dialogs.dart';
//
// Future showCreateRequestSuccessfullyDialog(BuildContext context) async {
//
//   showCustomDialog(context, _buildBody(context), onDismissCallback: (){},);
// }
// _buildBody(BuildContext context){
//   return Padding(
//    padding: EdgeInsets.all(kScreenPaddingNormal.r),
//     child: Column(
//       children: [
//         Image.asset(Assets.gifPaySuccessfully),
//         VerticalSpace(kScreenPaddingNormal.h),
//         Text(tr(LocaleKeys.createRequestMassage),style: TextStyles().getRegularStyle(),textAlign: TextAlign.center,),
//         VerticalSpace(kScreenPaddingNormal.h),
//         CustomButton(onTap: ()=>_onPress(context),title: tr(LocaleKeys.submit),),
//       ],
//     ),
//   );
// }
// _onPress(BuildContext context)async {
//     Provider.of<MyRequestsViewModel>(context, listen: false).getRequestsList(reload: true);
//       NavigationService.goBack();
//       NavigationService.pushNamedAndRemoveUntil(Routes.layoutScreen,arguments: {"currentPage": 1});
//
//
// }