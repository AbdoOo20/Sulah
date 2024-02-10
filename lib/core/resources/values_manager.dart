import 'package:flutter/material.dart';

final size = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
final deviceHeight = size.size.height;
final deviceWidth = size.size.width;


const double kFormPaddingVertical = 12.0;
const double kFormPaddingHorizontal = 12.0;
const double kScreenPaddingNormal = 16.0;
const double kScreenPaddingLarge = 32.0;
const double kScreenPaddingBigNormal = 24.0;
const double kFormPaddingAllSmall = 4.0;
const double kFormPaddingAllLarge = 10.0;
const double kFormRadiusSmall = 10.0;
const double kFormRadius = 16.0;
const double kFormRadiusLarge = 30.0;
const double kLoadingIndicatorSize = 32.0;
const double kTextFieldIconSize = 24.0;
const double kTextFieldIconSizeLarge = 32.0;
const double kAppbarTextSize = 18.0;
class AppMargin{
  static const double m12 =12;
  static const double m14 =14;
  static const double m16 =16;
  static const double m18 =18;
  static const double m24 =24;
  static const double m30 =30;
  static const double m32 =32;
}class AppPadding{ static const double p8 =8;
  static const double p12 =12;

  static const double p14 =14;
  static const double p16 =16;
  static const double p18 =18;
  static const double p24 =24;
  static const double p30 =30;
  static const double p32 =32;
  static const double p36 =36;

}class AppSize{
  static const double s4 =4;
  static const double s8 =8;
  static const double s12 =12;
  static const double s14 =14;
  static const double s16 =16;
  static const double s18 =18;
  static const double s24 =24;
  static const double s30 =30;
  static const double s32 =32;
  static const double s36 = 36;
  static const double s64 =64;
  static const double s99 =99.56;
  static const double s87 =87.33;
}