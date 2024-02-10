// import 'package:adhmn/core/res/text_styles.dart';
// import 'package:adhmn/domain/logger.dart';
// import 'package:adhmn/generated/assets.dart';
// import 'package:adhmn/main.dart';
// import 'package:adhmn/presentation/component/component.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
//
// import '../../../core/resources/values_manager.dart';
// import '../../../core/routing/navigation_services.dart';
// import '../../../generated/locale_keys.g.dart';
// import '../../component/svg_icon.dart';
//
// class CancelRequestSheet extends StatefulWidget {
//   @override
//   State<CancelRequestSheet> createState() => _CancelRequestSheetState();
//
//   const CancelRequestSheet({super.key});
// }
//
// class _CancelRequestSheetState extends State<CancelRequestSheet> {
//   final tag = 'CancelRequestSheet';
//  late Locale locale = context.locale;
//   @override
//   void initState() {
//     super.initState();
//     // locale = context.locale
//   }
//
//   void _onLanguageSelected() {
//     log('onLanguageSelected', 'change language to (${locale.languageCode})');
//     Navigator.pop(context);
//     context.setLocale(locale) ;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 40),
//       padding: const EdgeInsets.only(bottom: 32, top: 4),
//       decoration:  BoxDecoration(
//           borderRadius:const BorderRadius.vertical(top: Radius.circular(20)),
//           color: Theme.of(context).scaffoldBackgroundColor),
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Padding(
//               padding:  const EdgeInsets.all(kScreenPaddingNormal),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     tr(LocaleKeys.language),
//                     style: TextStyles().getTitleStyle(),
//                     textAlign: TextAlign.center,
//                   ),
//                   GestureDetector(
//                     onTap: ()=>NavigationService.goBack() ,
//                     child:const SVGIcon(Assets.svgExitIcon),
//                   ),
//                 ],
//               ),
//             ),
//
//             const Divider(height: 8),
//             ScreenStateLayout(
//               builder: (context) => buildBody(context,
//                   items: supportedLocales, selectedItem: locale),
//             ),
//             const VerticalSpace(kScreenPaddingNormal),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: kScreenPaddingNormal),
//               child: CustomButton(title: tr(LocaleKeys.submit),onTap: () =>_onLanguageSelected()),
//             )
//           ]),
//     );
//   }
//
//   Widget buildBody(BuildContext context, {required List<Locale> items, required Locale selectedItem}) {
//     return Container(
//       constraints: BoxConstraints(maxHeight: deviceHeight / 2),
//       child:Column(
//         children: [
//           // CustomTextFieldArea(hint: tr(LocaleKeys.message),controller: _messageController,textInputAction: TextInputAction.done,iconSVG: Assets.svgMassageIcon),
//           // Center(child: CustomButton(loading: isLoading,title: tr(LocaleKeys.send), onTap: ()=> _onSubmit(context))),
//
//         ],
//       )
//     );
//   }
//
//
// }
//
// Future<dynamic> showCancelRequestSheet(BuildContext context) async {
//   return showMaterialModalBottomSheet(
//     expand: false,
//     context: context,
//     backgroundColor: Colors.transparent,
//     builder: (context) => const SafeArea(child: CancelRequestSheet()),
//   );
//
// }
