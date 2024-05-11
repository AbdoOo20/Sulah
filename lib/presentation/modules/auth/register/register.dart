import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/res/text_styles.dart';
import 'package:khedmaty/core/resources/values_manager.dart';
import 'package:khedmaty/presentation/modules/auth/register/widgets/picker_part.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/locale_keys.g.dart';
import '../../../../core/utils/showToast.dart';
import '../../../../data/model/body/register_body.dart';
import '../../../component/component.dart';
import '../../../component/svg_icon.dart';
import '../auth_view_model.dart';
import '../login/widgets/country_sheet.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);
    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _onSubmit(context) async {
    RegisterBody registerBody = RegisterBody();
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        String firstName = _firstNameController.text;
        String lastName = _lastNameController.text;
        String phone = Provider.of<AuthViewModel>(context, listen: false)
            .phoneController
            .text;
        if (firstName.isEmpty) {
          ToastUtils.showToast(
              '${LocaleKeys.firstName.tr()} ${LocaleKeys.required.tr()}');
        } else if (lastName.isEmpty) {
          ToastUtils.showToast(
              '${LocaleKeys.lastName.tr()} ${LocaleKeys.required.tr()}');
        } else if (_image == null) {
          ToastUtils.showToast(LocaleKeys.logo.tr());
        } else if (phone.isEmpty) {
          Provider.of<AuthViewModel>(context, listen: false).validationMsg =
              LocaleKeys.phoneMustBeEntered.tr();
        } else if (phone.length < 7) {
          Provider.of<AuthViewModel>(context, listen: false).validationMsg =
              LocaleKeys.msgInvalidPhoneNumber.tr();
        } else {
          registerBody.firstName = _firstNameController.text;
          registerBody.lastName = _lastNameController.text;
          registerBody.phoneCode = Provider.of<AuthViewModel>(context, listen: false)
              .phoneCode;
          if (kDebugMode) {
            //  print('sssssssssss${widget.phoneCode}');
          }
          registerBody.phone = phone;
          registerBody.image = _image;
          Provider.of<AuthViewModel>(context, listen: false)
              .register(context, registerBody).then((value){
            Provider.of<AuthViewModel>(context, listen: false)
                .phoneController
                .clear();
            Provider.of<AuthViewModel>(context, listen: false)
                .passwordController
                .clear();
            _firstNameController.clear();
            _lastNameController.clear();
          });
          // updateProviderData(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<AuthViewModel>().isLoading;
    return CustomScaffold(
      appBar: CustomAppBar(
        title: tr(LocaleKeys.createAnAccount),
        titleColor: AppColors.black,
        color: AppColors.white,
      ),
      body: Padding(
          padding:
              EdgeInsets.only(top: 14.h, right: 12.w, left: 12.w, bottom: 32.h),
          child: Column(
            children: [
              Expanded(
                child: ListAnimator(
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
                        child: PickerPart(
                          image: _image,
                        )),
                    VerticalSpace(AppSize.s32.h),
                    _buildForm(),
                    VerticalSpace(AppSize.s8.h),
                  ],
                ),
              ),
              CustomButton(
                color: AppColors.primaryColor,
                loading: isLoading,
                onTap: () {
                  _onSubmit(context);
                },
                title: tr(LocaleKeys.register),
              ),
            ],
          )),
    );
  }

  _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 171.5.w,
                child: CustomTextFieldNormal(
                  label: LocaleKeys.firstName.tr(),
                  controller: _firstNameController,
                ),
              ),
              HorizontalSpace(8.w),
              SizedBox(
                width: 171.5.w,
                child: CustomTextFieldNormal(
                  label: LocaleKeys.lastName.tr(),
                  controller: _lastNameController,
                ),
              ),
            ],
          ),
          VerticalSpace(AppSize.s24.h),
          InkWell(
            onTap: () {
              showChangeCountrySheet(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              height: 56.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.grayLight,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SVGIcon(
                        Provider.of<AuthViewModel>(context, listen: true)
                                    .phoneCode ==
                                '+966'
                            ? Assets.flag
                            : Assets.flagEgypt,
                        width: 48.w,
                        height: 32.h,
                      ),
                      HorizontalSpace(12.w),
                      Text(
                        Provider.of<AuthViewModel>(context, listen: true)
                                    .phoneCode ==
                                '+966'
                            ? LocaleKeys.saudiArabia.tr()
                            : LocaleKeys.egypt.tr(),
                        style: const TextStyle()
                            .bodyStyle()
                            .customColor(AppColors.black),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 16.r,
                  )
                ],
              ),
            ),
          ),
          VerticalSpace(AppSize.s8.h),
          CustomTextFieldPhone(
            noBorder: false,
            validationMSG:
                Provider.of<AuthViewModel>(context, listen: true).validationMSG,
            hint: LocaleKeys.phoneNumber.tr(),
            iconSVG: Assets.phoneIcon,
            controller: Provider.of<AuthViewModel>(context, listen: false)
                .phoneController,
          ),
          VerticalSpace(AppSize.s8.h),
          CustomTextFieldPassword(
            noBorder: false,
            hint: LocaleKeys.password.tr(),
            iconSVG: Assets.svgPasswordIcon,
            controller: Provider.of<AuthViewModel>(context, listen: false)
                .passwordController,
          ),
        ],
      ),
    );
  }

  Future<dynamic> showChangeCountrySheet(BuildContext context) async {
    return showModalBottomSheet(
      // expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const SafeArea(child: CountrySheet()),
    );
  }
}
