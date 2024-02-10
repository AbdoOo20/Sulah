import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';


import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../component/svg_icon.dart';
import '../../shoppingCard/shopping_cared_view_model.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ShoppingCaredViewModel>(context, listen: true).paymentType;
    return Column(
      children: [
        Container(
          height: 64.h,
         // margin: EdgeInsets.symmetric(vertical: 6.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              ),
          padding:
              EdgeInsets.only(top: 10.h, bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 45.w,
                    child: SVGIcon(
                      Assets.cashWallet,
                      color: AppColors.primaryColor,
                      width: (24.w),
                      height: (24.h),
                    ),
                  ),
                  Container(
                    width: 170.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: RichText(
                          overflow: TextOverflow.ellipsis,
                          strutStyle: StrutStyle(fontSize: 12.0),
                          text: TextSpan(
                              style: TextStyles()
                                  .getRegularStyle(fontSize: 12.sp)
                                  .customColor(AppColors.gray),
                              text: LocaleKeys.paymentMethod.tr()),
                        )),
                        Flexible(
                            child: RichText(
                          overflow: TextOverflow.ellipsis,
                          strutStyle: StrutStyle(fontSize: 12.0),
                          text: TextSpan(
                            style: TextStyles()
                                .getRegularStyle(fontSize: 14.sp)
                                .customColor(AppColors.black),
                            text: provider == 'cash'
                                ? LocaleKeys.cash.tr()
                                : provider == 'online'
                                    ? LocaleKeys.applePay.tr()
                                    : '',
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.r,
              ),
            ],
          ),
        ),
        Container(color: AppColors.grayLight,height: .5.h,)
      ],
    );
  }
}
