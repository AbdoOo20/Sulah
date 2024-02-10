import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/presentation/component/svg_icon.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/app_colors.dart';
import '../../../../../../../../core/resources/locale_keys.g.dart';
import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../component/component.dart';
import '../../shoppingCard/shopping_cared_view_model.dart';

class ChoosePaymentMethod extends StatefulWidget {
  const ChoosePaymentMethod({Key? key}) : super(key: key);

  @override
  State<ChoosePaymentMethod> createState() => _ChoosePaymentMethodState();
}

class _ChoosePaymentMethodState extends State<ChoosePaymentMethod> {
  bool? choose ;

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<ShoppingCaredViewModel>(context, listen: false);

    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(36.h)),
          color: Theme.of(context).scaffoldBackgroundColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.paymentMethod.tr(),
                  style: TextStyles()
                      .getTitleStyle(
                        fontSize: 18.sp,
                      )
                      .customColor(AppColors.black),
                ),
                InkWell(
                  onTap: () {
                   Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: CircleAvatar(
                      backgroundColor: AppColors.black,
                      child: Center(
                          child: Icon(
                        Icons.clear,
                        size: 18.r,
                        color: AppColors.white,
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          InkWell(
            onTap: () {
              setState(() {
                provider.paymentTypeSet = 'cash';
                choose = false;
              });
            },
            child: Container(
              height: 45.h,
              margin: EdgeInsets.all(4.r),
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.h),
                  color: choose ==null?Colors.transparent:choose==true? AppColors.white : AppColors.second30,
                  border: Border.all(
                    width: 1.w,
                    color:choose ==null?Colors.transparent:choose==true? Colors.transparent : AppColors.primaryColor,
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.cash.tr(),
                    style: TextStyles()
                        .getRegularStyle(
                          fontSize: 14.sp,
                        )
                        .customColor(AppColors.black),
                  ),
                  SVGIcon(
                    Assets.cash,
                    height: 27.h,
                    width: 40.w,
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                provider.paymentTypeSet = 'online';
                choose = true;
              });
            },
            child: Container(
              height: 45.h,
              margin: EdgeInsets.all(4.r),
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.h),
                color:choose ==null?Colors.transparent:choose==true? AppColors.second30 : AppColors.white,
                border: Border.all(
                  width: 1.w,
                  color:choose ==null?Colors.transparent:choose==true? AppColors.primaryColor : Colors.transparent,

                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocaleKeys.applePay.tr(),
                    style: TextStyles()
                        .getRegularStyle(
                          fontSize: 14.sp,
                        )
                        .customColor(AppColors.black),
                  ),
                  SVGIcon(
                    Assets.imagesApplePay,
                    height: 27.h,
                    width: 40.w
                  )
                ],
              ),
            ),
          ),
          CustomButton(
            title: LocaleKeys.confirm.tr(),
            onTap: () {
              Navigator.pop(context);
            },
            color: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
