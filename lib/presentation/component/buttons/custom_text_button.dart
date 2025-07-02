
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';
import '../custom_text.dart';
import '../svg_icon.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final String? icon;
  final double textSize;
  final double? width;
  final FontWeight fontWeight;
  final Color? textColor;
  final Color? borderColor;

  const CustomTextButton({
    this.onPressed,
    required this.text,
    this.textColor,
    this.fontWeight = FontWeightManager.bold,
    this.textSize = FontSize.s16,
    Key? key, this.icon, this.borderColor, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: 48.h,
        width:width?? 162.w,
        decoration: BoxDecoration(
          border: Border.all(color:borderColor?? AppColors.gray),
          borderRadius: BorderRadius.circular(12.sp)
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SVGIcon(icon??Assets.logOut),
              SizedBox(width: 10.w),
              CustomText(
                text,
                color: textColor ??  Theme.of(context).primaryColor,
                fontSize: textSize.sp,
                fontWeight: fontWeight,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
