import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';

import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/routing/route.dart';
import '../../../../../component/svg_icon.dart';
import '../children/products/products.dart';




class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      child: GestureDetector(
        onTap: () {
          push(const Productions(isFrom: 'home',));
        },
        child: Container(
            padding: EdgeInsets.all(8.r),
            height: 55.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: AppColors.grayLight,
            ),
            child: Row(
              children: [
                const SVGIcon(Assets.searchIcon),
                SizedBox(width: 10.w),
                Text(
                  LocaleKeys.findaProduct.tr(),
                  style: TextStyles()
                      .getDescriptionStyle(fontSize: 14.sp)
                      .customColor(AppColors.black),
                ),
              ],
            )
        ),
      ),
    );
  }
}
