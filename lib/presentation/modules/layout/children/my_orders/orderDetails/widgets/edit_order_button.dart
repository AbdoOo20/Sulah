import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/routing/route.dart';
import 'package:provider/provider.dart';


import '../../../../../../../core/res/text_styles.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../component/buttons/custom_text_button.dart';
import '../../../../ButtonNavBar.dart';
import '../../my_orders_view_model.dart';
import '../../my_orders.dart';

class EditOrderButton extends StatelessWidget {
  const EditOrderButton({Key? key, required this.orderId}) : super(key: key);
  final String orderId;

  @override
  Widget build(BuildContext context) {
    void createAlertDialogDeleteAccount() {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return  CancelOrderDialog(orderId: orderId,);
          });
    }
    return
      Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Center(
        child: CustomTextButton(
           // width: 138.w,
          width: 276.w,
            onPressed: () {createAlertDialogDeleteAccount();},
            icon: Assets.close,
            text: tr(LocaleKeys.cancel),
            textColor: AppColors.black,
            textSize: 14.sp,
            borderColor: AppColors.black,
          ),
      ),
      // Row(
      //   children: [
      //     // CustomTextButton(
      //     //   width: 138.w,
      //     //   onPressed: () {},
      //     //   icon: Assets.modify,
      //     //   text: tr(LocaleKeys.modify),
      //     //   textColor: AppColors.black,
      //     //   textSize: 14.sp,
      //     //   borderColor: AppColors.primaryColor,
      //     // ),
      //     CustomTextButton(
      //      // width: 138.w,
      //     width: 276.w,
      //       onPressed: () {},
      //       icon: Assets.close,
      //       text: tr(LocaleKeys.cancel),
      //       textColor: AppColors.black,
      //       textSize: 14.sp,
      //       borderColor: AppColors.black,
      //     ),
      //   ],
      // ),
    );
  }
}

class CancelOrderDialog extends StatelessWidget {
  const CancelOrderDialog({
  super.key, required this.orderId,
  });
  final String orderId;

  @override
  Widget build(BuildContext context) {
     return AlertDialog(
          content: Text(
            'cancellingOrder'.tr(),
            style: TextStyles()
                .getRegularStyle(fontSize: 16.sp)
                .boldStyle()
                .customColor(AppColors.primaryColor),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
              child: GestureDetector(
                  onTap: () {
                    Provider.of<MyOrdersViewModel>(context, listen: false).cancelOneOrderApi(context,orderId ?? "").then((value) => pushAndRemoveUntil(const CustomBottomNavigationBar(2)));
                  },
                  child:Provider.of<MyOrdersViewModel>(context, listen: true).isLoading==true?SizedBox(width: 20.w,height: 20.h,child: Center(child: const CircularProgressIndicator(color: AppColors.primaryColor,strokeWidth: 2,)),) :Text(
                    LocaleKeys.confirm.tr(),
                    style: TextStyles()
                        .getRegularStyle(fontSize: 16.sp)
                        .boldStyle()
                        .customColor(AppColors.errorColor),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    LocaleKeys.cancel.tr(),
                    style: TextStyles()
                        .getRegularStyle(fontSize: 16.sp)
                        .boldStyle()
                        .customColor(AppColors.primaryColor),
                  )),
            ),
          ],
        );
  // });
  }
}
