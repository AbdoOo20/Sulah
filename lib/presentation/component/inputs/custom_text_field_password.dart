import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sulah/core/extensions/num_extensions.dart';

import '../../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';
import 'base_form.dart';

class CustomTextFieldPassword extends StatefulWidget {
  final String? suffixText;
  final String? hint;
  final String? defaultValue;
  final String? label;
  final String? iconSVG;

  final bool readOnly;
  final bool autoValidate;
  final bool noBorder;
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

  const CustomTextFieldPassword({
    Key? key,
    this.suffixText,
    this.hint,
    this.defaultValue,
    this.label,
    this.iconSVG,
    this.readOnly = false,
    this.autoValidate = false,
    this.noBorder = false,
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
  }) : super(key: key);

  @override
  State<CustomTextFieldPassword> createState() =>
      _CustomTextFieldPasswordState();
}

class _CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      background: widget.background,
      prefixIcon: widget.iconData ?? Icons.lock_outlined,
      prefixIconColor: AppColors.primaryColor,

      //prefixWidget: SizedBox(height: 20.r,width: 20.r,child: Center(child: SvgPicture.asset(widget.iconSVG??Assets.svgPasswordIcon,height: 20.r,width: 20.r))),

      defaultValue: widget.defaultValue,
      hint: widget.hint,
      onTap: widget.onTap,
      autoValidate: widget.autoValidate,
      enable: widget.enable,
      isDark: widget.isDark,
      noBorder: widget.noBorder,
      obscureText: _showPassword,
      isRequired: widget.isRequired,
      label: widget.label,
      contentPaddingH: widget.contentPaddingH,
      lines: widget.lines ?? 1,
      fontSize: widget.fontSize,
      radius: widget.radius,
      onChange: widget.onChange,
      suffixIconData: widget.suffixIconData,
      validateFunc: widget.validateFunc ??
          (value) {
            // if (value.toString().length == 11) {
            //   return tr(LocaleKeys.msgInvalidPhoneNumber);
            // }
          },
      suffixText: widget.suffixText,
      formatter: widget.formatter,
      type: TextInputType.name,
      controller: widget.controller,
      suffixData: widget.suffixData ??
          IconButton(
            icon: Icon(
              _showPassword ? Icons.visibility : Icons.visibility_off,
              color: AppColors.primaryColor,
            ),
            onPressed: () {
              _togglePasswordVisibility();
            },
          ),
      onSubmit: widget.onSubmit,
      maxLength: widget.maxLength,
      readOnly: widget.readOnly,
      autofocus: widget.readOnly,
      textInputAction: widget.textInputAction,
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}
