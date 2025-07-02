
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:shimmer/shimmer.dart';

import '../res/text_styles.dart';
import '../resources/app_assets.dart';
import '../resources/app_colors.dart';





class NoDataScreen extends StatelessWidget {
  final String  title;
  final String? desc;
  final String image;
   NoDataScreen({Key? key, this.title = "noResultFound",  this.desc ,  this.image = Assets.gifEmptyList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.all(16.r),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            image,
            width:200.w,
            height: 200.w,
          ),


          const SizedBox(height: 12),
          Shimmer.fromColors(
            baseColor: AppColors.gray,
            highlightColor: Colors.grey.shade300,
            child: Text(tr(title),
              textAlign: TextAlign.center,
              style: TextStyles()
                  .getTitleStyle(fontSize: 14.sp)
                  .customColor(AppColors.gray),
            ),
          ),

          // Text(
          //   tr(title),
          //   style: TextStyles().getTitleStyle(),
          //   textAlign: TextAlign.center,
          // ),
           // VerticalSpace(12.h),


          Text(
            desc??'',
            style: TextStyles().getRegularStyle(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),

        ]),
      ),
    );
  }
}
