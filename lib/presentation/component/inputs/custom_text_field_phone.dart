import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart' as el;
import 'package:sulah/core/extensions/num_extensions.dart';

import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/locale_keys.g.dart';
import '../../../core/resources/app_colors.dart';
import 'base_form.dart';

class CustomTextFieldPhone extends StatelessWidget {
  final String? suffixText;
  final String? hint;
  final String? defaultValue;
  final String? label;
  final String? iconSVG;
  final String? validationMSG;

  final bool readOnly;
  final bool autoValidate;
  final bool noBorder;
  final bool hasIcon;
  final bool isRequired;
  final bool autofocus;
  final bool enable;
  final bool isDark;

  final int? lines;
  final int? maxLength;

  final double? fontSize;
  final double? radius;
  final double? contentPaddingH;

  final List<TextInputFormatter>? formatter;

  final Widget? icon;
  final Widget? suffixData;

  final IconData? iconData;
  final IconData? suffixIconData;

  final Color? background;

  final VoidCallback? onTap;
  final ValueChanged<String>? onChange;
  final Function? validateFunc;
  final Function? onSubmit;

  final TextEditingController? controller;
  final TextInputAction? textInputAction;

  const CustomTextFieldPhone({
    Key? key,
    this.suffixText,
    this.hint,
    this.defaultValue,
    this.label,
    this.iconSVG,
    this.autoValidate = false,
    this.readOnly = false,
    this.noBorder = true,
    this.hasIcon = false,
    this.isRequired = true,
    this.autofocus = false,
    this.enable = true,
    this.isDark = false,
    this.lines,
    this.maxLength,
    this.fontSize,
    this.radius,
    this.contentPaddingH,
    this.formatter,
    this.icon,
    this.suffixData,
    this.iconData,
    this.suffixIconData,
    this.background,
    this.onTap,
    this.onChange,
    this.validateFunc,
    this.onSubmit,
    this.controller,
    this.textInputAction,
    this.validationMSG,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      background: background,
      prefixIcon: iconData,
      prefixWidget: SizedBox(
        height: 20.r,
        width: 20.r,
        child: Center(
          child: hasIcon
              ? Icon(
                  Icons.visibility_outlined,
                  size: 20.r,
                  color: AppColors.primaryColor,
                )
              : SvgPicture.asset(
                  iconSVG ?? Assets.svgPhoneIcon,
                  height: 20.r,
                  width: 20.r,
                  color: AppColors.primaryColor,
                ),
        ),
      ),
      defaultValue: defaultValue,
      hint: hint,
      onTap: onTap,
      autoValidate: autoValidate,
      enable: enable,
      isDark: isDark,
      noBorder: noBorder,
      isRequired: isRequired,
      label: label,
      contentPaddingH: contentPaddingH,
      lines: lines,
      fontSize: fontSize,
      radius: radius,
      onChange: onChange,
      suffixIconData: suffixIconData,
      validateFunc: validateFunc ??
          (value) {
            if ((value ?? '').length < 9) {
              return el.tr(validationMSG ?? LocaleKeys.msgInvalidPhoneNumber);
            }

            if (validateFunc != null) return validateFunc!(value);
            return null;
          },
      suffixText: suffixText,
      type: TextInputType.phone,
      controller: controller,
      suffixData: suffixData,
      onSubmit: onSubmit,
      readOnly: readOnly,
      autofocus: autofocus,
      maxLength: maxLength,
      icon: icon,
      textInputAction: textInputAction,
    );
  }
}
