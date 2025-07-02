import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/core/resources/app_colors.dart';
import 'package:provider/provider.dart';
import '../../core/res/text_styles.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/locale_keys.g.dart';
import '../../core/resources/values_manager.dart';
import '../../core/utils/showToast.dart';
import '../component/buttons/custom_button.dart';
import '../component/inputs/custom_text_field_area.dart';
import '../component/spaces.dart';
import '../component/svg_icon.dart';
import '../modules/layout/children/home/children/products/widget/rate_par.dart';
import '../modules/layout/children/my_orders/my_orders_view_model.dart';


class RateDialog extends StatefulWidget {
final String    orderId;
final String    storeId;



const RateDialog({super.key, required this.orderId, required this.storeId,
  });

  @override
  State<RateDialog> createState() => _RateDialogState();
}


class _RateDialogState extends State<RateDialog> {
  final TextEditingController _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
  final rateLoading=  Provider.of<MyOrdersViewModel>(context, listen: true).rateLoading;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:  const EdgeInsets.all(kScreenPaddingNormal),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                tr('shopRate'),
                  style: TextStyles().getTitleStyle(),
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: ()=>Navigator.pop(context) ,
                  child:const SVGIcon(Assets.closePup),
                ),
              ],
            ),
          ),
          RateWidget(initialRating:Provider.of<MyOrdersViewModel>(context, listen: false).rate),
          Padding(
            padding:  EdgeInsets.all(kScreenPaddingNormal.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(key: _formKey,child:CustomTextFieldArea(hint: tr(LocaleKeys.writeExperience),controller: _messageController,textInputAction: TextInputAction.done)),
                VerticalSpace(kScreenPaddingNormal.h),
                CustomButton(
                    title: tr(LocaleKeys.send),
                    color: AppColors.primaryColor,
                    loading: rateLoading,
                    onTap: () async {
                      if (Provider.of<MyOrdersViewModel>(context, listen: false).rate<1) {
                        ToastUtils.showToast("youMustEnterYourRating".tr());
                      }else if (_messageController.text.isEmpty) {
                        ToastUtils.showToast('${LocaleKeys.message.tr()} ${LocaleKeys.required.tr()}');
                      }else {
                        Provider.of<MyOrdersViewModel>(context, listen: false)
                            .rateApi(
                            context, widget.orderId, _messageController.text,
                            widget.storeId);
                      }
                    })
              ],
            ),
          ),
          // Column(
          //   children: [
          //     Container(
          //       height: ScreenUtil().setHeight(50),
          //       decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(30)), color: Theme.of(context).primaryColorDark),
          //       child: Align(
          //         alignment: AlignmentDirectional.center,
          //         child: Text(
          //           tr(LocaleKeys.booking),
          //           style: TextStyles(context).getRegularStyle(),
          //         ),
          //       ),
          //     ),
          //
          //
          //     Padding(
          //       padding: EdgeInsets.all(kFormPaddingAllNormal),
          //       child: Text(
          //         _massage,
          //         textAlign: TextAlign.center,
          //         style: TextStyles(context).getRegularStyle(),
          //       ),
          //     ),
          //   ],
          // ),
          // Padding(
          //   padding: EdgeInsets.symmetric(vertical: kFormFieldTopBottomMargin),
          //   child: Consumer<CarDetailsViewModel>(
          //     builder: (context, viewModel, child) =>
          //     viewModel.isLoading
          //         ? buildLoadingIndicator(context, size: ScreenUtil().setWidth(40))
          //         : Column(
          //             children: [
          //               Row(
          //                 children: [
          //                   Expanded(
          //                     child: CustomButton(
          //                       onTap: () => Navigator.pop(context),
          //                       buttonText: tr(LocaleKeys.cancel),
          //                       backgroundColor: Theme.of(context).primaryColor,
          //                     ),
          //                   ),
          //                   SizedBox(
          //                     width: kFormPaddingAllNormal,
          //                   ),
          //                   Expanded(
          //                     child: CustomButton(
          //                       onTap: (){
          //                         Navigator.pop(context);
          //                         _onTap();
          //                       },
          //
          //                       buttonText: tr(LocaleKeys.complete),
          //                       backgroundColor: Theme.of(context).primaryColorDark,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ],
          //           ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

 showRateDialog(BuildContext context,{required String    orderId,
  required String  storeId}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      alignment: Alignment.center,
      elevation: 0,
      backgroundColor: Colors.white,
      child: SizedBox(
        // height: 180,
        child: RateDialog(
          orderId: orderId,
          storeId:storeId ,
        ),
      ),
    ),
  );
}
