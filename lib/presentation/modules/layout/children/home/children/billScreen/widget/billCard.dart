import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';

import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/resources.dart';
import 'productItemPrice.dart';

class BillCard extends StatefulWidget {
  const BillCard(
      {Key? key,
       required this.totalPrice,})
      : super(key: key);
  final num totalPrice;

  @override
  State<BillCard> createState() => _BillCardState();
}

class _BillCardState extends State<BillCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.grayLight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.products.tr(),
            style: TextStyles()
                .getTitleStyle(
                  fontSize: 12.sp,
                )
                .customColor(AppColors.gray),
          ),
          ProductItemPrice(),
          SizedBox(height: 4.h)
          // MySeparator(color: Colors.grey.shade400,),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 8.0.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         LocaleKeys.theTax.tr(),
          //         style: TextStyles().getRegularStyle(fontSize: 12.sp,).customColor(AppColors.black),
          //       ),
          //       Text.rich(
          //         TextSpan(
          //           children: <TextSpan>[
          //             TextSpan(
          //               text: "${widget.taxValue}",
          //               style: TextStyles()
          //                   .getTitleStyle(
          //                 fontSize: 18.sp,
          //               )
          //                   .customColor(AppColors.black),
          //             ),
          //             TextSpan(
          //               text: LocaleKeys.sar.tr(),
          //               style: TextStyles()
          //                   .getRegularStyle(
          //                 fontSize: 12.sp,
          //               )
          //                   .customColor(AppColors.black),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // MySeparator(color: Colors.grey.shade400,),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: 8.0.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         LocaleKeys.delivery.tr(),
          //         style: TextStyles().getRegularStyle(fontSize: 12.sp,).customColor(AppColors.black),
          //       ),
          //       Text.rich(
          //         TextSpan(
          //           children: <TextSpan>[
          //             TextSpan(
          //               text: "${widget.deliveryPrice}",
          //               style: TextStyles()
          //                   .getTitleStyle(
          //                     fontSize: 18.sp,
          //                   )
          //                   .customColor(AppColors.black),
          //             ),
          //             TextSpan(
          //               text: LocaleKeys.sar.tr(),
          //               style: TextStyles()
          //                   .getRegularStyle(
          //                     fontSize: 12.sp,
          //                   )
          //                   .customColor(AppColors.black),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          //   MySeparator(color: Colors.grey.shade400,),
         , Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.theTotal.tr(),
                style: TextStyles()
                    .getTitleStyle(
                      fontSize: 14.sp,
                    )
                    .customColor(AppColors.black),
              ),
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '${widget.totalPrice}',
                      style: TextStyles()
                          .getTitleStyle(
                            fontSize: 18.sp,
                          )
                          .customColor(AppColors.primaryColor),
                    ),
                    TextSpan(
                      text: LocaleKeys.sar.tr(),
                      style: TextStyles()
                          .getRegularStyle(
                            fontSize: 12.sp,
                          )
                          .customColor(AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
