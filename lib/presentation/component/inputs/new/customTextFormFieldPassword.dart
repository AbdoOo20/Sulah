import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_colors.dart';
import '../../svg_icon.dart';



class CustomTextFormFiledPassword extends StatefulWidget {
  final Widget? widget;
  final String image;
  final String? hintText;
  final double? height;
  final Color? backGroundColor;
  final Color? borderColor;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;

  const CustomTextFormFiledPassword({
    Key? key,
    this.widget,
    required this.image,
    this.hintText,
    this.controller,
    this.textInputAction,
    this.textInputType, this.height, this.backGroundColor, this.borderColor,
  }) : super(key: key);

  @override
  State<CustomTextFormFiledPassword> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiledPassword> {
  bool _showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      //top: 22,bottom: 22,
       padding: EdgeInsets.only(right: 16,),
      width: double.infinity,
      height: widget.height??64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 0.1,
          color: widget.borderColor??AppColors.grayLight,
        ),
        boxShadow: const [
          BoxShadow(color: AppColors.white, spreadRadius: 0),
        ],
        color: widget.backGroundColor??AppColors.main10,
        // gradient: const LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   colors: [
        //     MyColors.caredColor,
        //     MyColors.gray,
        //   ],
        // ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(

            children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget.widget == null ? false : true,
                  autofocus: false,
                  obscureText: _showPassword,
                  decoration: InputDecoration(
                    suffixIcon: SVGIcon(
                      widget.image,
                      //'assets/images/svg$image.svg',
                      width: (20),
                      height: (20),
                    ),
                    border: InputBorder.none,
                    hintText: widget.hintText?.tr(),
                    hintStyle: TextStyles()
                        .getRegularStyle(fontSize: 14)
                        .customColor(AppColors.black),
                    prefixIcon: IconButton(
                          icon: Icon(_showPassword ? Icons.visibility : Icons.visibility_off,color:AppColors.primaryColor),
                          onPressed: () {
                            _togglePasswordVisibility();
                          },
                        ),
                  ),
                  controller: widget.controller,
                  textInputAction: widget.textInputAction,
                  keyboardType: widget.textInputType ?? TextInputType.text,
                  cursorColor: AppColors.primaryColor,
                  style: const TextStyle(
                      letterSpacing: 0.5, fontSize: 18, color: AppColors.black),
                  validator: (value) {
                    return null;
                  },
                  onSaved: (newValue) {},
                ),
              ),


            ],
          ),
          Container(
            child: widget.widget,
          ),

        ],
      ),
    );
  }
  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}
