import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/app_colors.dart';
import '../../../../../../../../core/resources/locale_keys.g.dart';
import '../../../../../../../data/model/response/myOrdersModel.dart';


class ListProductsPrice extends StatelessWidget {
  const ListProductsPrice({super.key,required this.oneOrderModel});
 final MyOneOrderModel? oneOrderModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: oneOrderModel?.orderDetails?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Container(margin: EdgeInsets.symmetric(vertical: 6.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        oneOrderModel?.orderDetails?[index].product?.title??'',
                        style: TextStyles()
                            .getRegularStyle(
                          fontSize: 14.sp,
                        ).customColor(AppColors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "${oneOrderModel?.orderDetails?[index].amount??''}",
                                    style: TextStyles()
                                        .getTitleStyle(
                                      fontSize: 14.sp,
                                    )
                                        .customColor(
                                        AppColors.gray),
                                  ),
                                  TextSpan(
                                    text: 'x',
                                    style: TextStyles()
                                        .getRegularStyle(
                                      fontSize: 12.sp,
                                    )
                                        .customColor(
                                        AppColors.gray),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width:MediaQuery.of(context).size.width*0.4,
                            ),
                            Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "${double.parse(oneOrderModel?.orderDetails?[index].product?.price.toString()??'').toPrecision(1)}",
                                    style: TextStyles()
                                        .getTitleStyle(
                                      fontSize: 18.sp,
                                    )
                                        .customColor(
                                        AppColors.black),
                                  ),
                                  TextSpan(
                                    text: LocaleKeys.sar.tr(),
                                    style: TextStyles()
                                        .getRegularStyle(
                                      fontSize: 12.sp,
                                    ).customColor(
                                        AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                // oneOrderModel?.orderDetails?[index].items?.length==0? SizedBox(): Row(
                //   children: [
                //     Text(
                //       'extras'.tr(),
                //       style: TextStyles()
                //           .getTitleStyle(
                //         fontSize: 14.sp,
                //       ).customColor(AppColors.gray),
                //       maxLines: 1,
                //       overflow: TextOverflow.ellipsis,
                //     ),
                //   ],
                // ),
                // oneOrderModel?.details?[index].items?.length==0? SizedBox(): ConstrainedBox(constraints: BoxConstraints(maxHeight:MediaQuery.of(context).size.height.h, minHeight: 56.0.h),
                //   child: ListView.builder(
                //     padding: EdgeInsets.symmetric(horizontal: 20.w),
                //       physics: NeverScrollableScrollPhysics(),
                //       shrinkWrap: true,
                //       itemCount: oneOrderModel?.details?[index].items?.length,
                //       itemBuilder: (BuildContext context, int index2) {
                //         return Column(
                //           children: [
                //             Container(margin: EdgeInsets.symmetric(vertical: 6.h),
                //               // height: MediaQuery.of(context).size.height/9,
                //               height: 25.h,
                //               child: Row(
                //                 mainAxisAlignment:
                //                 MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Expanded(
                //                     child: Text(
                //                       oneOrderModel?.details?[index].items?[index].item?.title??'',
                //                       style: TextStyles()
                //                           .getRegularStyle(
                //                         fontSize: 14.sp,
                //                       ).customColor(AppColors.gray),
                //                       maxLines: 1,
                //                       overflow: TextOverflow.ellipsis,
                //                     ),
                //                   ),
                //                   Row(
                //                     children: [
                //                       Row(
                //                         children: [
                //                           Text.rich(
                //                             TextSpan(
                //                               children: <TextSpan>[
                //                                 TextSpan(
                //                                   text: "${oneOrderModel?.details?[index].items?[index].qty??0}",
                //                                   style: TextStyles()
                //                                       .getTitleStyle(
                //                                     fontSize: 14.sp,
                //                                   ).customColor(
                //                                       AppColors.gray),
                //                                 ),
                //                                 TextSpan(
                //                                   text: 'x',
                //                                   style: TextStyles()
                //                                       .getRegularStyle(
                //                                     fontSize: 12.sp,
                //                                   )
                //                                       .customColor(
                //                                       AppColors.gray),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                           SizedBox(
                //                             width:MediaQuery.of(context).size.width*0.4,
                //                           ),
                //                           Text.rich(
                //                             TextSpan(
                //                               children: <TextSpan>[
                //                                 TextSpan(
                //                                   text: "${(oneOrderModel?.details?[index].items?[index].item?.price)}",
                //                                   style: TextStyles()
                //                                       .getTitleStyle(
                //                                     fontSize: 18.sp,
                //                                   )
                //                                       .customColor(
                //                                       AppColors.black),
                //                                 ),
                //                                 TextSpan(
                //                                   text: LocaleKeys.sar.tr(),
                //                                   style: TextStyles()
                //                                       .getRegularStyle(
                //                                     fontSize: 12.sp,
                //                                   )
                //                                       .customColor(
                //                                       AppColors.black),
                //                                 ),
                //                               ],
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ],
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ],
                //         );
                //       }),
                // ),
                // MySeparator(color: Colors.grey.shade400,),
              ],
            ),
          );
        });
  }
}
