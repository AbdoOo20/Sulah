import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/res/text_styles.dart';
import 'package:khedmaty/presentation/component/inputs/new/customTextFormField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/data/model/body/update_profile_body.dart';
import 'package:khedmaty/presentation/component/component.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/resources/locale_keys.g.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/utils/showToast.dart';
import '../../../../../component/svg_icon.dart';
import '../../../../auth/auth_view_model.dart';


class ModifyTheAccount extends StatefulWidget {
  const ModifyTheAccount({Key? key}) : super(key: key);

  @override
  State<ModifyTheAccount> createState() => _ModifyTheAccountState();
}

class _ModifyTheAccountState extends State<ModifyTheAccount> {
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  // final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _onSubmit(context) async {
    UpdateProfileBody updateProfileBody = UpdateProfileBody();
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        String firstName = _firstNameController.text;
        String lastName = _lastNameController.text;
        if (firstName.isEmpty) {
          ToastUtils.showToast('${LocaleKeys.firstName.tr()}${LocaleKeys.required.tr()}');

        } else if (lastName.isEmpty) {
          ToastUtils.showToast('${LocaleKeys.lastName.tr()}${LocaleKeys.required.tr()}');
        } else {
          updateProfileBody.firstName = _firstNameController.text;
          updateProfileBody.lastName = _lastNameController.text;
          updateProfileBody.image = _image;
          Provider.of<AuthViewModel>(context, listen: false)
              .updateProfile(context, updateProfileBody);
          // updateProviderData(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<AuthViewModel>().isLoading;
    final image = Provider.of<AuthViewModel>(context, listen: true)
        .saveUserData
        .getUserData()
        ?.data
        ?.logo;
    return CustomScaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.modifyTheAccount.tr(),
          titleColor: AppColors.black,
        ),
        body: Padding(
          padding:
              EdgeInsets.only(left: 16.w, right: 16.w),
          child: ListAnimator(
            children: [
              SizedBox(height: 1.h),
              Row(mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.r),
                        )),
                        builder: (BuildContext context) {
                          return SafeArea(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: const Icon(Icons.camera_alt),
                                  title: Text('takePicture'.tr()),
                                  onTap: () {
                                    _getImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.image),
                                  title: Text('chooseFromGallery'.tr()),
                                  onTap: () {
                                    _getImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 124.r,
                      width: 124.r,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(color: AppColors.grayLight)
                      ),
                      child: Center(
                        child: Stack(
                          children: [
                            if (_image == null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: SizedBox(
                                  height: 117.r,
                                  width: 117.r,
                                  child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl: image ?? '',
                                      placeholder: (context, url) =>
                                      new Center(child: SizedBox(width:20,height:20,child: CircularProgressIndicator(strokeWidth: 1,))),
                                      errorWidget: (context, url, error) => Container(
                                            height: 117.h,
                                            width: 117.w,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(Assets.person,),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            // Image.asset(
                                            //   Assets.splash,
                                            //   fit: BoxFit.cover,
                                            // ),
                                          )),
                                ),
                              ),
                            if (_image != null)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100.r),
                                child: SizedBox(
                                  height: 117.h,
                                  width: 117.w,
                                  child: Image.file(
                                    _image!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            Positioned(
                                bottom: 6.h,
                                right: 10.w,
                                child: const SVGIcon(Assets.add))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              VerticalSpace(32.h),
              _buildForm(context),
              VerticalSpace(300.h),
              CustomButton(color: AppColors.primaryColor,
                loading: isLoading,
                onTap: () {
                  _onSubmit(context);
                },
                title: LocaleKeys.confirm.tr(),
                width: double.infinity,
              )
            ],
          ),
        ));
  }

  _buildForm(BuildContext context) {
    final provider = Provider.of<AuthViewModel>(context, listen: false);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 167.5.w,
                child: CustomTextFieldNormal(
                  defaultValue:
                      provider.saveUserData.getUserData()?.data?.name?.split(' ').first,
                  label: LocaleKeys.firstName.tr(),
                  controller: _firstNameController,
                ),
              ),
              SizedBox(
                width: 167.5.w,
                child: CustomTextFieldNormal(
                  defaultValue:
                      provider.saveUserData.getUserData()?.data?.name?.split(' ').last,
                  label: LocaleKeys.lastName.tr(),
                  controller: _lastNameController,
                ),
              ),
            ],
          ),
          VerticalSpace(30.h),
          VerticalSpace(30.h),
          VerticalSpace(30.h),
          // CustomTextFormFiled(
          //   defaultValue:
          //   provider.saveUserData.getUserData()?.data?.phone,
          //   controller: _phoneController,
          //   textInputType: TextInputType.phone,
          //   lable: Text(LocaleKeys.phoneNumber.tr(),style: TextStyles()
          //       .getRegularStyle(fontSize: 12.sp)
          //       .customColor(AppColors.gray),),
          //   icon: Assets.phoneIcon,backGroundColor: AppColors.grayLight,)
        ],
      ),
    );
  }
}
