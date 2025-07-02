import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/core/resources/app_colors.dart';
import 'package:sulah/core/resources/resources.dart';

import '../../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../../data/model/response/one_product_model.dart';
import 'inerDetailsCared.dart';

class DetailsCared extends StatelessWidget {
  const DetailsCared({super.key, this.oneProduct});
  final OneProduct? oneProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      // height: 200.h,
      padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFF7F5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          children: [
            SizedBox(
              width: 290.w,
              child: Text(
                oneProduct?.title??'',
                style: TextStyles()
                    .getTitleStyle(
                  fontSize: 14.sp,
                )
                    .customColor(AppColors.black),
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.favorite_outlined)
          ],
        ),
          SizedBox(height: 4.h),
          // Text.rich(
          //   TextSpan(
          //     children: [
          //       TextSpan(
          //         text: LocaleKeys.pieceNumber.tr(),
          //         style: TextStyles()
          //             .getRegularStyle(
          //           fontSize: 12.sp,
          //         )
          //             .customColor(AppColors.black),
          //       ),
          //       TextSpan(
          //         text: ' ${oneProduct?.code??''} ',
          //         style: TextStyles()
          //             .getRegularStyle(
          //           fontSize: 12.sp,
          //         )
          //             .customColor(AppColors.primaryColor),
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 4.h),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     Text.rich(
          //       TextSpan(
          //         children: [
          //           TextSpan(
          //             text: '${LocaleKeys.made.tr()} :',
          //             style: TextStyles()
          //                 .getRegularStyle(
          //               fontSize: 12.sp,
          //             )
          //                 .customColor(AppColors.black),
          //           ),
          //           const TextSpan(
          //             text: ' ',
          //             style: TextStyle(
          //               color: Color(0xFF666B88),
          //               fontSize: 12,
          //               fontFamily: 'MadaniArabic-SemiBold',
          //               fontWeight: FontWeight.w400,
          //               height: 0,
          //             ),
          //           ),
          //           TextSpan(
          //             text:oneProduct?.type=='0'? LocaleKeys.original.tr():LocaleKeys.copycat.tr(),
          //             style: TextStyles()
          //                 .getTitleStyle(
          //               fontSize: 14.sp,
          //             )
          //                 .customColor(AppColors.green),
          //           ),
          //
          //         ],
          //       ),
          //     ),
          //
          //   ],
          // ),
          // SizedBox(height: 12.h),
          // Text(
          //   '${LocaleKeys.compatibleWith.tr()} ::',
          //   style: TextStyles()
          //       .getRegularStyle(
          //     fontSize: 12.sp,
          //   )
          //       .customColor(AppColors.black),
          // ),
          // SizedBox(height: 8.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InerDetailsCared(title:LocaleKeys.company.tr(), color: AppColors.main20,),
                    InerDetailsCared(title:LocaleKeys.car.tr(), color: AppColors.main20,),
                    //InerDetailsCared(title: LocaleKeys.model.tr(), color: AppColors.main20,),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: oneProduct?.productsAdditions?.length??0,
                  itemBuilder: (context,index){
                    return  Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InerDetailsCared(title: oneProduct?.productsAdditions?[index].brand?.title??'', color: AppColors.white,),
                        InerDetailsCared(title: oneProduct?.productsAdditions?[index].car?.title??'', color: AppColors.white,),
                        //InerDetailsCared(title: oneProduct?.productsAdditions?[index].manufactureYear??'', color: AppColors.white,),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
