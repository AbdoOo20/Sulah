

import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';

import '../resources/values_manager.dart';
import 'color.dart';
import 'text_styles.dart';





extension CustomDecoration on BoxDecoration {
  BoxDecoration radius({double radius=kFormRadius}) => (this).copyWith(borderRadius: BorderRadius.all(Radius.circular(radius)));
  BoxDecoration circle({double radius=kFormRadius}) => (this).copyWith(shape: BoxShape.circle);
  BoxDecoration customRadius({required BorderRadius borderRadius}) => (this).copyWith(borderRadius: borderRadius);
  BoxDecoration shadow({double radius=kFormRadius}) => (this).copyWith(boxShadow: [const BoxShadow(color: grayScaleLiteColor, spreadRadius: 1, blurRadius: 5)]);
  BoxDecoration listStyle({double radius=kFormRadius}) => (this).copyWith(color: cardColor,borderRadius: BorderRadius.all(Radius.circular(radius)));
  BoxDecoration borderStyle({double width=1,Color color = grayScaleColor ,}) => (this).copyWith(border: Border.all(width: width,color: color));
  BoxDecoration customColor(Color? color) => (this).copyWith(color: color);
}




TextStyle appBarTextStyle = const TextStyle(
    fontSize: kAppbarTextSize,
    height: 1
);

final InputDecorationTheme kInputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: cardColor,

  hintStyle: const TextStyle().regularStyle().hintColor(),
  labelStyle: const TextStyle().regularStyle().colorWhite(),
  suffixStyle: const TextStyle().regularStyle().customColor(grayScaleColor),
  errorStyle: const TextStyle().descriptionStyle().errorStyle(),

  prefixIconColor:primaryColorDark ,
  iconColor:primaryColorDark ,


  disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppSize.s12.r), borderSide: const BorderSide(color: primaryColor, width: 1),),
  contentPadding: EdgeInsets.all(12.w),
  errorMaxLines: 2,
  focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: grayLight), borderRadius: BorderRadius.circular(AppSize.s12.r),),
  enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: grayLight), borderRadius: BorderRadius.circular(AppSize.s12.r),),
  errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: errorColor), borderRadius: BorderRadius.circular(AppSize.s12.r),),
  focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: grayLight), borderRadius: BorderRadius.circular(AppSize.s12.r),),
);