import 'package:flutter/material.dart';

import '../../resources/font_manager.dart';

TextStyle _getFontStyle(FontWeight fontWeight, double fontSize, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontFamily: FontConstants.fontFamilyRegular,
      color: color);
}
/// RegularStyle and can do so on the more style
TextStyle getRegularStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getFontStyle(FontWeightManager.bold, fontSize, color);
}
