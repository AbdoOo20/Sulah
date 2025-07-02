
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/core/res/text_styles.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/font_manager.dart';
import '../../component.dart';
import 'title_container.dart';


class CustomButtonArrow extends StatelessWidget {
  final String? title;
  final String? hint;
  final String? error;
  final String? iconSVG;
  final Color? color;
  final Color? textColor;
  final IconData? iconData;
  final double paddingV = 6;
  final double paddingH = 6;
  final double marginV = 6;
  final double marginH = 6;
  final bool bold = true;
  final bool loading = false;
  final bool fullWidth = false;
  final bool shadow = false;
  final bool isRequired = false;
  final bool isDark;
  final double? width;
  final double? height;
  final GestureTapCallback? onTap;

  const CustomButtonArrow(
      {Key? key,
      this.title,
      this.hint,
      this.error,
      this.iconData,
      this.iconSVG,
      this.isDark = false,
      this.width,
      this.height,
      this.color,
      this.textColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        InkWell(
          onTap:onTap,
          borderRadius:  BorderRadius.all(Radius.circular(kFormRadius.r),),
          child: TitleContainer(
            title: title != null ? hint : null,
            textAlign: context.locale.languageCode == 'ar' ?TextAlignTitledContainer.Right :TextAlignTitledContainer.Left,

            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(kFormRadiusSmall.r),),
                  border: Border.all(color:error!=null? Theme.of(context).primaryColorLight: AppColors.grayLight)),
              padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
              child: loading
                  ? Center(
                      child: Container(
                        width: 30,
                        height: 30,
                        padding: const EdgeInsets.all(4),
                        child: CircularProgressIndicator(
                          color: textColor ?? Colors.white,
                          strokeWidth: 1.2,
                        ),
                      ),
                    )
                  : Container(
                      height: height ?? 35,
                      width: width,
                      // padding: const EdgeInsets.symmetric(horizontal: kFormPaddingAllLarge),
                      child: Row(
                        children: [
                          if(iconData!=null)...[
                            Icon(iconData,color: Theme.of(context).inputDecorationTheme.prefixIconColor,),
                            HorizontalSpace(8.w)
                          ],

                            if(iconSVG!=null)...[
                              SizedBox(height: 24.r,width: 24.r,child: Center(child: SvgPicture.asset(iconSVG!,height: 24.r,width: 24.r))),
                            HorizontalSpace(8.w)
                          ],

                          Expanded(
                            child: Text(
                              title ?? hint ?? '',
                              style:  const TextStyle()
                                  .bodyStyle(fontSize: FontSize.s14.sp)
                                  .textCustomColor(AppColors.black),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                           Icon(Icons.keyboard_arrow_down_rounded,size: 24.r,)
                        ],
                      ),
                    ),
            ),
          ),
        ),
        buildErrorView(context)
      ],
    );
  }

  buildErrorView(BuildContext context) {
    return error != null
        ? Column(
            children: [
              const SizedBox(
                height: (10),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    error ?? '',
                    style: Theme.of(context)
                        .inputDecorationTheme
                        .errorStyle
                        ?.copyWith(color: Theme.of(context).disabledColor),
                  ),
                ],
              )
            ],
          )
        : const SizedBox.shrink();
  }
}
