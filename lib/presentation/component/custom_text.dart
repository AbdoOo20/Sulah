import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';

import '../../../core/resources/font_manager.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? height;
  final int? maxLines;
  final TextDecoration? decoration;

  const CustomText(
    this.text, {
    this.color,
    this.fontSize = FontSize.s14,
    this.fontWeight = FontWeightManager.bold,
    this.textAlign,
    this.height,
    this.overflow,
    this.maxLines,
    this.decoration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style: TextStyle(
        color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
        fontSize: fontSize.sp,
        fontFamily: FontConstants.fontFamilyRegular,
        fontWeight: fontWeight,
        height: height?.h,
        decoration: decoration,
      ),
    );
  }
}
