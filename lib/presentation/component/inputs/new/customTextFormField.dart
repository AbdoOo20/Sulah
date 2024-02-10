import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_colors.dart';
import '../../svg_icon.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomTextFormFiled extends StatefulWidget {
  final Widget? widget;
  final bool? readOnly;
  final String ?image;
  final String? icon;
  final String? hintText;
  final String? defaultValue;
  final Widget? lable;
  final double? height;
  final Color? backGroundColor;
  final Color? borderColor;
  final Color? hintColor;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;

  const CustomTextFormFiled({
    Key? key,
    this.widget,
    this.image,
    this.hintText,
    this.controller,
    this.textInputAction,
    this.textInputType, this.height, this.backGroundColor, this.borderColor, this.icon, this.hintColor, this.readOnly, this.lable, this.defaultValue,
  }) : super(key: key);

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  @override
  void initState() {
    super.initState();
    if (widget.defaultValue != null && widget.controller != null) {
      widget.controller!.text = widget.defaultValue!;
    }else{
    }
  }
  Widget build(BuildContext context) {
    return Container(
      //top: 22,bottom: 22,
      // padding: EdgeInsets.only(right: 16.w,),
      padding: EdgeInsets.all( 2.w),
      width: double.infinity,
      height: widget.height??64.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 0.9.w,
          color: widget.borderColor??Colors.transparent,
        ),
        boxShadow: const [
          BoxShadow(color: AppColors.white, spreadRadius: 0),
        ],
        color: widget.backGroundColor??AppColors.main10,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              readOnly: widget.readOnly == null ? false : true,
              autofocus: false,
              decoration: InputDecoration(

                fillColor: widget.backGroundColor,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusColor:Colors.transparent ,
                icon:widget.icon==null ?SizedBox():Padding(
                  padding: EdgeInsets.only(right: 8.0.w),
                  child: SVGIcon(
                    widget.icon??'',
                    //'assets/images/svg$image.svg',
                    width: (24.w),
                    height: (24.h),
                  ),
                ),
                suffixIcon:widget.image==null ?SizedBox(): SVGIcon(
                  widget.image??'',
                  //'assets/images/svg$image.svg',
                  width: (20.w),
                  height: (20.h),
                ),

                //border: InputBorder.none,
                hintText: widget.hintText?.tr(),
                label: widget.lable,
                hintStyle: TextStyles()
                    .getRegularStyle(fontSize: 14.sp)
                    .customColor(widget.hintColor??AppColors.black),
              ),
              controller: widget.controller,
              textInputAction: widget.textInputAction,
              keyboardType: widget.textInputType ?? TextInputType.text,
              cursorColor: AppColors.primaryColor,
              style: TextStyle(
                  letterSpacing: 0.5, fontSize: 18.sp, color: AppColors.black),
              validator: (value) {
                return null;
              },
              onSaved: (newValue) {},
            ),
          ),
          Container(
            child: widget.widget,
          ),
        ],
      ),
    );
  }
}
