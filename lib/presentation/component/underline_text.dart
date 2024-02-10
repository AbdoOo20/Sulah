
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';

import '../../../core/resources/font_manager.dart';
import 'component.dart';

class UnderlinedText extends StatelessWidget {
  final String text;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final double fontSize;
  final CrossAxisAlignment crossAxisAlignment;
  final FontWeight fontWeight;

  const UnderlinedText(this.text,
      {this.fontSize = FontSize.s16,
      this.fontWeight= FontWeightManager.medium,
      this.width,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.margin,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          CustomText(text, color:Theme.of(context).primaryColor, fontSize: fontSize, fontWeight:fontWeight),
          VerticalSpace(2.h),
          Container(height: 2.h, color: Theme.of(context).hintColor.withOpacity(0.5))
        ],
      ),
    );
  }
}
