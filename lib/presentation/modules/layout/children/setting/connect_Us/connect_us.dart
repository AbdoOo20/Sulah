import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/presentation/component/component.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/utils/showToast.dart';
import '../../../../../../data/model/body/contactUsBody.dart';
import '../../../../../component/svg_icon.dart';
import '../settingViewModel.dart';


class ConnectUs extends StatefulWidget {
  ConnectUs({Key? key}) : super(key: key);

  @override
  State<ConnectUs> createState() => _ConnectUsState();
}

class _ConnectUsState extends State<ConnectUs> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _subjectController = TextEditingController();

  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
  final loading= Provider.of<SettingViewModel>(context, listen: true).isLoading;
    return CustomScaffold(
        appBar: CustomAppBar(
            title: LocaleKeys.connectUs.tr(),
            titleColor: AppColors.black,),
        body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w,top: 24.h),
          child: ListAnimator(
            children: [
              SVGIcon(
                Assets.connectUsIcon,
                  width: 196.42025756835938.w,
                  height: 150.h
              ),
              VerticalSpace(48.h),
              _buildForm(context),
              VerticalSpace(48.h),
              VerticalSpace(16.h),
              CustomButton(
                loading: loading,
                  color: AppColors.primaryColor,
                  title: LocaleKeys.send.tr(),
                  onTap: () {
                    _onSubmit(context);
                  })
            ],
          ),
        ));
  }

  _buildForm(context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFieldNormal(
              iconSVG: Assets.name,
              hint: LocaleKeys.name.tr(),
              controller: _nameController,
            ),
            VerticalSpace(12.h),
            CustomTextFieldNormal(
              iconSVG: Assets.email,
              hint: LocaleKeys.email.tr(),
              controller: _emailController,
            ),
            VerticalSpace(12.h),
            CustomTextFieldNormal(
              iconSVG: Assets.messageTitle,
              hint: LocaleKeys.messageTitle.tr(),
              controller: _subjectController,
            ),
            VerticalSpace(12.h),
            CustomTextFieldArea(
               iconSVG: Assets.message,
              hint: LocaleKeys.message.tr(),
              controller: _messageController,
            ),
          ],
        ));
  }
  void _onSubmit(context) async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        String name = _nameController.text;
        String email = _emailController.text;
        String subject = _subjectController.text;
        String message = _messageController.text;

        if (name.isEmpty) {
          ToastUtils.showToast("nameIsRequired".tr());
        } else if (email.isEmpty) {
          ToastUtils.showToast("emailIsRequired".tr());
        } else if (subject.isEmpty) {
          ToastUtils.showToast('${LocaleKeys.messageTitle.tr()} ${LocaleKeys.required.tr()}');

        }else if (message.isEmpty) {
          ToastUtils.showToast("messageIsRequired".tr());

        } else {
         ContactUsBody body = ContactUsBody();
         body.name = name;
          body.email = email;
          body.subject = subject;
         body.message = message;
          Provider.of<SettingViewModel>(context, listen: false).contactUsApi(context,body);
      }}}}

}
