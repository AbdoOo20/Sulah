
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/res/color.dart';
import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/locale_keys.g.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../core/resources/app_colors.dart';
import '../spaces.dart';
import 'expaned_form_view.dart';
import 'orientation_view.dart';





class CustomTextField extends StatefulWidget {
  final String? suffixText;
  final String? hint;
  final String? defaultValue;
  final String? label;
  final bool isHorizontal;

  final bool enable;
  final bool isDark;
  final bool isDarkBackground;
  final bool autoValidate;
  final bool readOnly;
  final bool obscureText;
  final bool noBorder;
  final bool isRequired;
  final bool autofocus;

  final int? maxLength;
  final int? lines;

  final double? fontSize;
  final double? radius;
  final double? contentPaddingH;

  final List<TextInputFormatter>? formatter;

  final Color? prefixIconColor;
  final Color? background;
  final Color? hintColor;

  final IconData? prefixIcon;
  final IconData? suffixIconData;

  final Widget? suffixData;
  final Widget? prefixWidget;
  final Widget? icon;


  final VoidCallback? onTap;
  final ValueChanged<String>? onChange;
  final ValueChanged<String>? onSaved;
  final Function? validateFunc;
  final Function? onSubmit;


  final TextAlign? textAlign;
  final TextInputType type;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;

  const CustomTextField({Key? key,
    this.background,
    this.prefixIcon,
    this.textAlign,
    this.prefixIconColor,
    this.defaultValue,
    // this.error,
    this.hint,
    this.hintColor,
    this.onTap,
    this.autoValidate = false,
    this.isDarkBackground = false,
    this.obscureText = false,
    this.readOnly=false,
    this.isHorizontal=false,
    this.enable = true,
    this.isDark = false,
    this.noBorder = false,
    this.isRequired = true,
    this.autofocus=false,

    this.label,
    this.contentPaddingH = 16,
    this.lines = 1,
    this.fontSize = 14,
    this.radius = 15,
    this.onChange,
    this.onSaved,
    this.suffixIconData,
    this.validateFunc,
    this.suffixText,
    this.formatter,
    this.type = TextInputType.text,
    this.controller,
    this.suffixData,
    this.onSubmit,
    this.maxLength,
    this.icon,
    this.textInputAction,
    this.prefixWidget,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    super.initState();
    if (widget.defaultValue != null && widget.controller != null) {
      widget.controller!.text = widget.defaultValue!;
    }else{
    }
  }
  @override
  Widget build(BuildContext context) {
    // if (widget.error == '') {
    //   widget.error = null;
    // }
    return GestureDetector(
      onTap: widget.onTap,
      child: OrientationView(
        isHorizontal: widget.isHorizontal,
        children: [
          if (widget.isHorizontal)...[
            CircleAvatar(radius: 4.r, backgroundColor: widget.isDark?Theme.of(context).cardColor:Theme.of(context).hintColor),
            HorizontalSpace(8.h),
            if (widget.label != null)...[
            Expanded(flex: 2,child: Text(widget.label!, style: TextStyles().getRegularStyle().customColor( widget.isDark?Theme.of(context).cardColor:Theme.of(context).hintColor),)),
            ]
          ],

          // if (!widget.isHorizontal && widget.label != null) ...[
          //   Text(widget.label!, style: TextStyles().getRegularStyle(fontSize: 16).boldStyle().customColor( widget.isDark?Theme.of(context).cardColor:Colors.black),),
          //   const VerticalSpace(kFormPaddingAllSmall,),
          // ],

          if (widget.isHorizontal) HorizontalSpace(16.w),
          Container(
            // height: 100.h,
            // decoration: BoxDecoration(
            //     border: Border.all(color: grayScaleDarkColor),
            //
            //     borderRadius: BorderRadius.all(Radius.circular(kFormRadiusSmall.r))

            // ),
            child: ExpandedHelperView(
              isExpanded: widget.isHorizontal ,
              child: TextFormField(
                // inputFormatters:widget.type==TextInputType.phone? [
                //   FilteringTextInputFormatter.digitsOnly,
                //   LengthLimitingTextInputFormatter(9),
                //   FilteringTextInputFormatter.deny(RegExp('^0+'))
                // ]:[],
                cursorColor:widget.isDark? Theme.of(context).cardColor: Theme.of(context).primaryColor,
                readOnly:widget.readOnly,
                textInputAction: widget.textInputAction,
                maxLength: widget.maxLength,

                autofocus: widget.autofocus,
                obscureText: widget.obscureText,
                onTap: widget.onTap,
                controller:  widget.controller,
                textAlign: widget.textAlign??TextAlign.start,
                autovalidateMode: widget.autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                style:  TextStyle(
                  color: widget.isDark?Theme.of(context).primaryColor:AppColors.black,
                  fontSize: FontSize.s14.sp,
                  fontFamily: FontConstants.fontFamilyRegular,
                ),
                decoration: InputDecoration(

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                          color: AppColors.grayLight, width: 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                          color: AppColors.grayLight, width: 1),
                    ),
                    // border: Theme.of(context).inputDecorationTheme.border,
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                          color: AppColors.grayLight, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide:  BorderSide(
                          color: AppColors.grayLight, width: 1),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                          color: AppColors.grayLight, width: 1),
                    ),

                    filled: true,
                    errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
                    hintStyle: Theme.of(context).inputDecorationTheme.hintStyle?.copyWith(color: widget.isDark?Theme.of(context).highlightColor:widget.hintColor??AppColors.black),
                    labelStyle: Theme.of(context).inputDecorationTheme.labelStyle?.copyWith(color: widget.isDark?AppColors.black:AppColors.black),
                    suffixStyle: Theme.of(context).inputDecorationTheme.suffixStyle?.copyWith(color: widget.isDark?AppColors.black:AppColors.black),


                    hintText: widget.hint,
                    labelText:widget.label,
    fillColor: AppColors.white     ,
    counterStyle:  TextStyle(color: Theme.of(context).primaryColor),
                    suffixText: widget.suffixText,
                    // suffixIcon: widget.icon!= null ?Container(width: 50,alignment: Alignment.center,child: widget.icon):(widget.suffixData ?? (widget.suffixIconData == null ? null : Icon(widget.suffixIconData, color:widget.isDark?Theme.of(context).cardColor:Theme.of(context).primaryColor,))),
                    suffixIcon: widget.suffixData != null ? Container(width: 50, alignment: Alignment.center, child: widget.suffixData,) : (widget.suffixData ?? (widget.suffixIconData == null ? null : Icon(widget.suffixIconData, color: Theme.of(context).primaryColor,))),

                    // suffixStyle:  const TextStyle(
                    //   color:grayScaleColor,
                    //   fontSize: 12,
                    //   fontWeight: FontWeight.normal,
                    // ),
                    prefixIcon:widget.prefixWidget??( widget.prefixIcon == null ? null : Icon(widget.prefixIcon, size: 24,color:widget.prefixIconColor??(widget.isDark?Theme.of(context).cardColor:Theme.of(context).primaryColorDark),)),

                    contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p12,vertical: AppPadding.p8)),
                keyboardType: widget.type,
                validator: (value) {
                  if ((value == null || value.isEmpty) && widget.isRequired) {
                    return tr(LocaleKeys.msgFormFieldRequired);
                  }
                  if (widget.validateFunc != null&& widget.isRequired) return widget.validateFunc!(value);
                  return null;
                },
                enabled: widget.enable,
                maxLines: widget.lines,

                inputFormatters: widget.formatter,
                onChanged: (String newValue) {
                  if (widget.onChange != null) return widget.onChange!(newValue);
                  return;
                },
                onFieldSubmitted: (String newValue) {
                  if (widget.onSubmit != null) return widget.onSubmit!(newValue);
                  return;
                },
                onSaved: (String? newValue) {
                  if (widget.onSaved != null) return widget.onSaved!(newValue??'');
                  return;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
