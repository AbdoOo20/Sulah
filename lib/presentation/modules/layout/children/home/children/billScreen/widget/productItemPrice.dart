import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/app_colors.dart';
import '../../../../../../../../core/resources/locale_keys.g.dart';
import '../../../../../../../../data/datasource/locale/database_provider.dart';
import '../../../../../../../component/seperator.dart';

class ProductItemPrice extends StatelessWidget {
  const ProductItemPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, child) {
     return ConstrainedBox(
       constraints: BoxConstraints(maxHeight:MediaQuery.of(context).size.height, minHeight: 56.0.h),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: cart.cartItems.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(margin: EdgeInsets.symmetric(vertical: 6.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          cart.cartItems[index].name??'',
                          style: TextStyles()
                              .getRegularStyle(
                            fontSize: 14.sp,
                          ).customColor(AppColors.black),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 115.w,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "${cart.cartItems[index].quantity}",
                                    style: TextStyles()
                                        .getTitleStyle(
                                      fontSize: 14.sp,
                                    ).customColor(
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

                            Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                  text: "${(cart.cartItems[index].price??0).toPrecision(1)}",
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
                                    )
                                        .customColor(
                                        AppColors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                // Row(
                //   children: [
                //     Text(
                //       'extras'.tr(),
                //       style: TextStyles()
                //           .getRegularStyle(
                //         fontSize: 14.sp,
                //       ).customColor(AppColors.black),
                //       maxLines: 1,
                //       overflow: TextOverflow.ellipsis,
                //     ),
                //   ],
                // ),
                // ConstrainedBox(
                //   constraints: BoxConstraints(maxHeight:MediaQuery.of(context).size.height.h, minHeight: 56.0.h),
                //   child: ListView.builder(
                //       physics: NeverScrollableScrollPhysics(),
                //       shrinkWrap: true,
                //       itemCount:  cart.cartItems[index].additionsCart.length,
                //       itemBuilder: (BuildContext context, int index2) {
                //         return Column(
                //           children: [
                //             Container(margin: EdgeInsets.symmetric(vertical: 6.h),
                //               height: 25.h,
                //               child: Row(
                //                 mainAxisAlignment:
                //                 MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Expanded(
                //                     child: Text(
                //                       cart.cartItems[index].additionsCart[index2].additionsName,
                //                       style: TextStyles()
                //                           .getRegularStyle(
                //                         fontSize: 14.sp,
                //                       ).customColor(AppColors.black),
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
                //                                   text: "${cart.cartItems[index].quantity??0}",
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
                //                                   text: "${(cart.cartItems[index].additionsCart[index2].additionsPrice)}",
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
                MySeparator(color: Colors.grey.shade400,),

              ],
            );
          }),
    );});
  }
}
