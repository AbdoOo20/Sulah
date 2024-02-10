import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/resources/resources.dart';
import 'package:khedmaty/presentation/component/svg_icon.dart';

import '../../../../core/res/text_styles.dart';
import '../component.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback _onTap;
  final Widget? _child;
  final String? _title;
  final String? _image;
  final Color? _imageColor;
  final Color? _color;
  final Color? borderColor;
  final Color? _textColor;
  final double? _width;
  final double? _height;
  final double? _borderRadius;
  final double? _fontSize;
  final bool _isRounded;
  final bool _isOutlined;
  final bool _widerPadding;
  final bool _loading;

  const CustomButton({
    super.key,
    required VoidCallback onTap,
    Widget? child,
    String? title,
    String? image,
    Color? imageColor,
    Color? color,
    Color? textColor,
    double? width,
    double? fontSize,
    double? height,
    double? borderRadius,
    bool isRounded = true,
    bool isOutlined = false,
    bool widerPadding = false,
    bool loading = false,
    this.borderColor,
  })  : _onTap = onTap,
        _child = child,
        _title = title,
        _image = image,
  _imageColor = imageColor,
        _color = color,
        _textColor = textColor,
        _width = width,
        _fontSize = fontSize,
        _height = height,
        _borderRadius = borderRadius,
        _isRounded = isRounded,
        _isOutlined = isOutlined,
        _widerPadding = widerPadding,
        _loading = loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width ?? deviceWidth,
      height: (_height ?? 53).h,
      child: TapEffect(
        isClickable: !_loading,
        onClick: _loading ? null : _onTap,
        child: MaterialButton(
          height: _height ?? 53.h,
          color: _isOutlined
              ? Colors.transparent
              : (_color ?? Theme.of(context).primaryColor),
          highlightElevation: 0,
          onPressed: _loading ? () {} : _onTap,
          padding: !_widerPadding
              ? EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w)
              : EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          elevation: 0,
          shape: _isRounded
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kFormRadiusSmall.r),
                  side: BorderSide(
                    color: _color ?? Theme.of(context).primaryColor,
                    width: 1.5.w,
                  ))
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_borderRadius ?? 10),
                  side: BorderSide(
                    color: borderColor ?? Theme.of(context).primaryColor,
                    width: 1.0.w,
                  ),
                ),
          child: _loading
              ? Padding(
                padding:  EdgeInsets.all(6.r),
                child: LoadingSpinner(
                     color: Theme.of(context).cardColor),
              )
              : _title != null
                  ? Center(
                      child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
             _image==null?SizedBox(): SVGIcon(
               _image!,
               height: 20.h,width: 20.w,color: _imageColor,),SizedBox(width: 5.w,),
                          Text(
                            _title!,
                            style: TextStyles()
                                .getRegularStyle(fontSize: _fontSize ?? 14)
                                .customColor(_textColor ?? Colors.white),
                          ),
                        ],
                      ),
                    )
                  : _child ?? const SizedBox(),
        ),
      ),
    );
  }
}
