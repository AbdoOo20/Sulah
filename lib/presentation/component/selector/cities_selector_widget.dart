// import 'package:adhmn/domain/entities/drop_down_entity.dart';
// import 'package:adhmn/generated/assets.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// import '../../../domain/logger.dart';
// import '../../../generated/locale_keys.g.dart';
// import '../../sheet/city_picker/city_picker_sheet.dart';
// import 'base/custom_btn_drop.dart';
//
// class CitiesSelectorWidget extends StatelessWidget {
//   final _tag = 'CitiesSelectorWidget';
//   final bool isMultiChoice;
//   final Function(DropDownEntity)? onSelected;
//   final Function(List<DropDownEntity>)? onSelectList;
//   final DropDownEntity? selectedValue;
//   final List<DropDownEntity>? selectedList;
//   final String? error;
//   final IconData? iconData;
//   final String? iconSVG;
//   final bool isDark;
//
//   const CitiesSelectorWidget(
//       {Key? key,
//         this.error,
//         this.iconData,
//         this.onSelectList,
//         this.isMultiChoice = false,
//         this.isDark = false,
//         this.onSelected,
//         this.iconSVG,
//         this.selectedList,
//         this.selectedValue})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomButtonArrow(
//         isDark:isDark,
//         iconSVG: iconSVG??Assets.svgLocationIcon,
//         error: error,
//         title:  selectedValue?.title??tr(LocaleKeys.selectHint),
//         hint: tr(LocaleKeys.city),
//         onTap: () =>
//           onPressed(context)
//         );
//   }
//
//   Future<void> onPressed(BuildContext context,) async {
//     var result = await showCityPicker(
//       context,
//       isMultiChoice: isMultiChoice,
//       defaultList: selectedList ?? [],
//       defaultValue: selectedValue,
//     );
//
//     log(_tag, 'onPressed: result= $result');
//     FocusManager.instance.primaryFocus?.unfocus();
//
//     if (result != null) {
//       if (isMultiChoice) {
//         if (onSelectList != null) {
//           onSelectList!(result);
//         }
//       } else {
//         if (onSelected != null) {
//           onSelected!(result);
//         }
//       }
//     } else {
//       log(_tag, 'result == null');
//     }
//   }
// }
