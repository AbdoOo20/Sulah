import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/res/text_styles.dart';
import 'package:khedmaty/presentation/component/svg_icon.dart';
import 'package:provider/provider.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../component/component.dart';
import '../../auth_view_model.dart';
import 'custom_pin_code_text_field.dart';
import 'resend_code.dart';


class ConfirmCodeSheet extends StatefulWidget {
  final String _phone;
  const ConfirmCodeSheet({super.key,
    required String phone,
  }) : _phone = phone;

  @override
  State<ConfirmCodeSheet> createState() => _ConfirmCodeSheetState();
}

class _ConfirmCodeSheetState extends State<ConfirmCodeSheet> {
  final _controller = TextEditingController();
  _onSubmit(){
    String otp = _controller.text;
    Provider.of<AuthViewModel>(context, listen: false).verifyOTPFirebase(otp, widget._phone, context);
  }
  @override
  Widget build(BuildContext context) {
    bool isLoading = Provider.of<AuthViewModel>(context, listen: true).isLoading;

    return
      Padding(
        padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
            borderRadius:
             BorderRadius.vertical(top: Radius.circular(AppSize.s36.r)),
        ),
        padding:  EdgeInsets.symmetric(horizontal: AppPadding.p24.w,vertical:AppPadding.p36.w ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SVGIcon(Assets.otp,height: 150.h,width: 225.w,),
            VerticalSpace(AppSize.s16.h),
            Center(
              child: Text(
                '${tr(LocaleKeys.otpMassage)} ${widget._phone}',
                textAlign: TextAlign.center,
                style: const TextStyle().regularStyle().heightStyle(height: 1.5.h).customColor(AppColors.black),
              ),
            ),
            VerticalSpace(AppSize.s16.h),
            CustomPinCodeTextField(controller: _controller),
            VerticalSpace(AppSize.s16.h),
             ResendConfirmCode(
              phone:widget._phone
            ),
            VerticalSpace(AppSize.s16.h),
            CustomButton(
              height: 50.h,
              loading: isLoading,
              onTap: _onSubmit,
              color: AppColors.primaryColor,
              title:  tr(LocaleKeys.confirm),
            ),
          ],
        ),
            ),
      );
  }
}