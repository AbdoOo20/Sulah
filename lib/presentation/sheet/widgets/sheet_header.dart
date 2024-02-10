//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// import '../../../../core/res/text_styles.dart';
// import '../../../../core/resources/locale_keys.g.dart';
// import '../../../../core/resources/values_manager.dart';
//
// class SheetHeader extends StatelessWidget {
//   final VoidCallback onCancelPress;
//   final VoidCallback onConfirmPressed;
//
//   final String title;
//   final bool isMultiChoice;
//   final String confirmText;
//
//   const SheetHeader({Key? key,
//     required this.onCancelPress,
//     required this.onConfirmPressed,
//     required this.isMultiChoice,
//     required this.title,
//     required this.confirmText,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:  const EdgeInsets.symmetric(horizontal: kFormPaddingAllLarge),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           TextButton(
//             onPressed: onCancelPress,
//             child: Text(tr(LocaleKeys.cancel).toUpperCase(),
//                 style: TextStyles().getDescriptionStyle()),
//           ),
//           Expanded(
//             child: Text(
//               title.toUpperCase(),
//               style: TextStyles().getDescriptionStyle(),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           TextButton(
//             onPressed: onConfirmPressed,
//             child: Text(confirmText.toUpperCase(),
//                 style: TextStyles().getRegularStyle()),
//           ),
//         ],
//       ),
//     );
//   }
// }
