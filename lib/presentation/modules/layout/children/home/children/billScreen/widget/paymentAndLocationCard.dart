import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:sulah/core/extensions/num_extensions.dart';

import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../component/svg_icon.dart';

class PaymentAndLocationCard extends StatelessWidget {
  const PaymentAndLocationCard(
      {Key? key,
      required this.deliveryAddressTitle,
      required this.paymentMethodTitle,
      this.commentsTitle})
      : super(key: key);
  final String deliveryAddressTitle;

  final String paymentMethodTitle;

  final String? commentsTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 168.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), color: AppColors.main30),
      child: Column(
        children: [
          // Container(
          //   height: 64.h,
          //   margin: EdgeInsets.symmetric(vertical: 6.h),
          //   padding: EdgeInsets.only(
          //       left: 16.w,
          //       right: 16.w,
          //       top: 10.h,
          //       bottom: 10.h),
          //   child: Row(
          //     children: [
          //       SizedBox(
          //         width: 45.w,
          //         child: SVGIcon(
          //           Assets.storeLocation,
          //           color: AppColors.primaryColor,
          //           width: (24.w),
          //           height: (24.h),
          //         ),
          //       ),
          //       SizedBox(
          //         width: 170.w,
          //         child: Column(
          //           crossAxisAlignment:
          //           CrossAxisAlignment.start,
          //           mainAxisAlignment:
          //           MainAxisAlignment.spaceBetween,
          //           children: [
          //
          //             Flexible(
          //                 child: RichText(
          //                   overflow: TextOverflow.ellipsis,
          //                   strutStyle: StrutStyle(fontSize: 12.0.sp),
          //                   text: TextSpan(
          //                       style: TextStyles()
          //                           .getRegularStyle(
          //                           fontSize: 12.sp)
          //                           .customColor(AppColors.gray),
          //                       text: LocaleKeys.store.tr()),
          //                 )),
          //             Flexible(
          //                 child: RichText(
          //                   overflow: TextOverflow.ellipsis,
          //                   strutStyle: StrutStyle(fontSize: 12.0),
          //                   text: TextSpan(
          //                     style: TextStyles()
          //                         .getRegularStyle(fontSize: 14.sp)
          //                         .customColor(AppColors.black),
          //                     text: storeTitle,
          //                   ),
          //                 )),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            // height: 64.h,
            margin: EdgeInsets.symmetric(vertical: 6.h),
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 10.h, bottom: 10.h),
            child: Row(
              children: [
                SizedBox(
                  child: SVGIcon(
                    Assets.locationIcon1,
                    color: AppColors.primaryColor,
                    width: (24.w),
                    height: (24.h),
                  ),
                ),
                SizedBox(width: 8.w),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        strutStyle: const StrutStyle(fontSize: 12.0),
                        text: TextSpan(
                            style: TextStyles()
                                .getRegularStyle(fontSize: 12.sp)
                                .customColor(AppColors.gray),
                            text: LocaleKeys.deliveryAddress.tr()),
                      ),
                      RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        strutStyle: const StrutStyle(fontSize: 12.0),
                        text: TextSpan(
                          style: TextStyles()
                              .getRegularStyle(fontSize: 14.sp)
                              .customColor(AppColors.black),
                          text: deliveryAddressTitle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 64.h,
            margin: EdgeInsets.symmetric(vertical: 6.h),
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 10.h, bottom: 10.h),
            child: Row(
              children: [
                SizedBox(
                  child: SVGIcon(
                    Assets.cashWallet,
                    color: AppColors.primaryColor,
                    width: (24.w),
                    height: (24.h),
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  width: 170.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: RichText(
                        overflow: TextOverflow.ellipsis,
                        strutStyle: StrutStyle(fontSize: 12.0.sp),
                        text: TextSpan(
                            style: TextStyles()
                                .getRegularStyle(fontSize: 12.sp)
                                .customColor(AppColors.gray),
                            text: LocaleKeys.paymentMethod.tr()),
                      )),
                      Flexible(
                          child: RichText(
                        overflow: TextOverflow.ellipsis,
                        strutStyle: StrutStyle(fontSize: 12.0.sp),
                        text: TextSpan(
                          style: TextStyles()
                              .getRegularStyle(fontSize: 14.sp)
                              .customColor(AppColors.black),
                          text: paymentMethodTitle,
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          commentsTitle != null && commentsTitle != ''
              ? Container(
                  // height: 64.h,
                  margin: EdgeInsets.symmetric(vertical: 6.h),
                  padding: EdgeInsets.only(
                      left: 16.w, right: 16.w, top: 10.h, bottom: 10.h),
                  child: Row(
                    children: [
                      Container(
                        child: SVGIcon(
                          Assets.comments,
                          color: AppColors.primaryColor,
                          width: (24.w),
                          height: (24.h),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              strutStyle: StrutStyle(fontSize: 12.0),
                              text: TextSpan(
                                  style: TextStyles()
                                      .getRegularStyle(fontSize: 12.sp)
                                      .customColor(AppColors.gray),
                                  text: LocaleKeys.comments.tr()),
                            ),
                            SizedBox(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 8,
                                strutStyle: StrutStyle(fontSize: 12.0),
                                text: TextSpan(
                                  style: TextStyles()
                                      .getRegularStyle(fontSize: 14.sp)
                                      .customColor(AppColors.black),
                                  text: commentsTitle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(),
          // Container(
          //   height: 64.h,
          //   margin: EdgeInsets.symmetric(vertical: 6.h),
          //   padding: EdgeInsets.only(
          //       left: 16.w,
          //       right: 16.w,
          //       top: 10.h,
          //       bottom: 10.h),
          //   child: Row(
          //     children: [
          //       Container(
          //         width: 45.w,
          //         child: SVGIcon(
          //           Assets.date1,
          //           color: AppColors.primaryColor,
          //           width: (24.w),
          //           height: (24.h),
          //         ),
          //       ),
          //       Container(
          //         width: 170.w,
          //         child: Column(
          //           crossAxisAlignment:
          //           CrossAxisAlignment.start,
          //           mainAxisAlignment:
          //           MainAxisAlignment.spaceBetween,
          //           children: [
          //             Flexible(
          //                 child: RichText(
          //                   overflow: TextOverflow.ellipsis,
          //                   strutStyle: StrutStyle(fontSize: 12.0.sp),
          //                   text: TextSpan(
          //                       style: TextStyles()
          //                           .getRegularStyle(
          //                           fontSize: 12.sp)
          //                           .customColor(AppColors.gray),
          //                       text: LocaleKeys.deliveryTime.tr()),
          //                 )),
          //             Flexible(
          //                 child: RichText(
          //                   overflow: TextOverflow.ellipsis,
          //                   strutStyle: StrutStyle(fontSize: 12.0.sp),
          //                   text: TextSpan(
          //                     style: TextStyles()
          //                         .getRegularStyle(fontSize: 14.sp)
          //                         .customColor(AppColors.black),
          //                     text: deliveryTime,
          //                   ),
          //                 )),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   height: 64.h,
          //   margin: EdgeInsets.symmetric(vertical: 6.h),
          //   padding: EdgeInsets.only(
          //       left: 16.w,
          //       right: 16.w,
          //       top: 10.h,
          //       bottom: 10.h),
          //   child: Row(
          //     children: [
          //       Container(
          //         width: 45.w,
          //         child: SVGIcon(
          //           Assets.time,
          //           color: AppColors.primaryColor,
          //           width: (24.w),
          //           height: (24.h),
          //         ),
          //       ),
          //       Container(
          //         width: 170.w,
          //         child: Column(
          //           crossAxisAlignment:
          //           CrossAxisAlignment.start,
          //           mainAxisAlignment:
          //           MainAxisAlignment.spaceBetween,
          //           children: [
          //             Flexible(
          //                 child: RichText(
          //                   overflow: TextOverflow.ellipsis,
          //                   strutStyle: StrutStyle(fontSize: 12.0.sp),
          //                   text: TextSpan(
          //                       style: TextStyles()
          //                           .getRegularStyle(
          //                           fontSize: 12.sp)
          //                           .customColor(AppColors.gray),
          //                       // text: LocaleKeys.preparationTime.tr()
          //                       text: LocaleKeys.timeReceipt.tr()
          //                   ),
          //                 )),
          //             Flexible(
          //                 child: RichText(
          //                   overflow: TextOverflow.ellipsis,
          //                   strutStyle: StrutStyle(fontSize: 12.0.sp),
          //                   text: TextSpan(
          //                     style: TextStyles()
          //                         .getRegularStyle(fontSize: 14.sp)
          //                         .customColor(AppColors.black),
          //                     text: preparationTime,
          //                   ),
          //                 )),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
