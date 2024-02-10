import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/presentation/component/component.dart';
import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/app_colors.dart';
import '../../../../../component/svg_icon.dart';


class InnerCard extends StatelessWidget {
  const InnerCard({Key? key, required this.name, required this.icon}) : super(key: key);
  final String name;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 97.h,
      width: 103.37.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(8.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SVGIcon(
            icon,
            width: (46.w),
            height: (46.h),
          ),
          VerticalSpace( 11.h),
          Text(
            name,
            style: TextStyles()
                .getTitleStyle(fontSize: 14.sp)
                .customColor(AppColors.black),
          ),
        ],
      ),
    );
  }
}
