import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/resources/app_colors.dart';
import 'package:khedmaty/core/routing/route.dart';
import 'package:khedmaty/presentation/modules/layout/ButtonNavBar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/locale_keys.g.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../data/app_urls/app_url.dart';
import '../../../../data/repository/SaveUserData.dart';
import '../../../../injection.dart';
import '../../../component/component.dart';
import '../../../component/svg_icon.dart';
import '../auth_view_model.dart';
import '../register/register.dart';
import 'widgets/country_sheet.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  void _onSubmit(BuildContext context) async {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        String phone = Provider.of<AuthViewModel>(context, listen: false)
            .phoneController
            .text;
        if (phone.isEmpty) {
          Provider.of<AuthViewModel>(context, listen: false).validationMsg =
              LocaleKeys.phoneMustBeEntered.tr();
        } else if (phone.length < 7) {
          Provider.of<AuthViewModel>(context, listen: false).validationMsg =
              LocaleKeys.msgInvalidPhoneNumber.tr();
        } else {
          getLocation(true);
          Provider.of<AuthViewModel>(context, listen: false)
              .login(phone: phone, context: context)
              .then((value) {
            Provider.of<AuthViewModel>(context, listen: false)
                .phoneController
                .clear();
            Provider.of<AuthViewModel>(context, listen: false)
                .passwordController
                .clear();
          });
          // Provider.of<AuthViewModel>(context, listen: false).sendOTPFirebase(context, phone);
        }
      }
    }
  }

  SaveUserData saveUserData = getIt();
  bool isLoading = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    String lang = saveUserData.getLang();
    log(LocaleKeys.termsAndConditions.tr().toString());
    log(AppURL.kBaseURL.toString());
    log(lang.toString());
    return CustomScaffold(
      body: Container(
        padding: EdgeInsets.only(
            right: AppSize.s16.w, left: AppSize.s16.w, bottom: AppSize.s8.h),
        child: ListAnimator(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SVGIcon(
                  Assets.logo,
                  height: 50.h,
                  width: 150.w,
                ),
              ],
            ),
            VerticalSpace(AppSize.s4.h),
            Text(
              tr(LocaleKeys.tittleLogin),
              style: const TextStyle()
                  .titleStyle(fontSize: FontSize.s28.sp)
                  .customColor(AppColors.black),
            ),
            Text(
              tr(LocaleKeys.bodyLogin),
              style: const TextStyle()
                  .bodyStyle(fontSize: FontSize.s14.sp)
                  .customColor(AppColors.gray),
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
            VerticalSpace(AppSize.s4.h),
            _buildForm(),
            VerticalSpace(AppSize.s4.h),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Text(
            //       tr("byContinuingYouAgreeTo"),
            //       style: const TextStyle()
            //           .bodyStyle(fontSize: FontSize.s14.sp)
            //           .customColor(AppColors.gray),
            //       textAlign: TextAlign.center,
            //     ),
            //     InkWell(
            //       onTap: () {
            //         push(WebViewScreen(
            //           title: LocaleKeys.termsAndConditions.tr(),
            //           url: 'https://sulah.sa/${lang}/privacy-policy',
            //         ));
            //       },
            //       child: Text(
            //         LocaleKeys.termsAndConditions.tr(),
            //         style: const TextStyle()
            //             .bodyStyle(fontSize: FontSize.s14.sp)
            //             .customColor(AppColors.primaryColor),
            //         textAlign: TextAlign.center,
            //       ),
            //     ),
            //     Text(
            //       tr("and"),
            //       style: const TextStyle()
            //           .bodyStyle(fontSize: FontSize.s14.sp)
            //           .customColor(AppColors.gray),
            //       textAlign: TextAlign.center,
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     InkWell(
            //       onTap: () {
            //         push(WebViewScreen(
            //           title: LocaleKeys.privacyPolicy.tr(),
            //           url: 'https://sulah.sa/${lang}/privacy-policy',
            //         ));
            //       },
            //       child: Text(
            //         LocaleKeys.privacyPolicy.tr(),
            //         style: const TextStyle()
            //             .bodyStyle(fontSize: FontSize.s14.sp)
            //             .customColor(AppColors.primaryColor),
            //         textAlign: TextAlign.center,
            //       ),
            //     ),
            //     Text(
            //       tr("applicationSpecific"),
            //       style: const TextStyle()
            //           .bodyStyle(fontSize: FontSize.s14.sp)
            //           .customColor(AppColors.gray),
            //       textAlign: TextAlign.center,
            //     ),
            //   ],
            // ),
            //VerticalSpace(AppSize.s64.h),
            VerticalSpace(AppSize.s16.h),
            CustomButton(
              color: AppColors.primaryColor,
              loading: isLoading,
              onTap: () {
                _onSubmit(context);
              },
              title: tr(LocaleKeys.login),
            ),
            VerticalSpace(AppSize.s4.h),
            InkWell(
              onTap: loading == true
                  ? () {}
                  : () {
                      getLocation(false).then((value) => pushAndRemoveUntil(
                          const CustomBottomNavigationBar(0)));
                    },
              child: loading == true
                  ? Center(
                      child: SizedBox(
                      width: 20.w,
                      height: 20.h,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: AppColors.primaryColor,
                      ),
                    ))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            push(const Register());
                          },
                          child: Text(
                            tr("تسجيل جديد") + ' ',
                            style: const TextStyle()
                                .bodyStyle(fontSize: FontSize.s14.sp)
                                .customColor(AppColors.gray),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            push(const Register());
                          },
                          child: Text(
                            tr(" ؟ ليس لديك حساب"),
                            style: const TextStyle()
                                .bodyStyle(fontSize: FontSize.s14.sp)
                                .customColor(AppColors.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  _buildForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFieldPhone(
              noBorder: false,
              validationMSG: Provider.of<AuthViewModel>(context, listen: true)
                  .validationMSG,
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
        ));
  }

  Future<dynamic> showChangeCountrySheet(BuildContext context) async {
    return showModalBottomSheet(
      // expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const SafeArea(child: CountrySheet()),
    );
  }

  Future<void> getLocation(bool isLogin) async {
    try {
      setState(() {
        isLogin ? isLoading = true : loading = true;
      });

      final status = await Permission.location.request();
      if (status.isGranted) {
        final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );

        final double latitude = position.latitude;
        final double longitude = position.longitude;
        final List<Placemark> placemarks = await placemarkFromCoordinates(
          latitude,
          longitude,
        );
        final String? address = placemarks[0].street;
        print('Address: ${placemarks[0].street}');
        print('Address: ${placemarks[0].country}');
        print('Address: ${placemarks[0].administrativeArea}');
        print('Address: $address');
        print('Latitude: $latitude, Longitude: $longitude');
        await saveUserData.saveDistance(address ?? '');
        await saveUserData.saveLongitude(longitude);
        await saveUserData.saveLatitude(latitude);
        print('Address: ${saveUserData.getDistance()}');
      } else {
        await [Permission.location].request();
        print('Location permission denied.');
      }
    } catch (e) {
      print('Error getting location: $e');
    }
    setState(() {
      isLogin ? isLoading = false : loading = false;
    });
  }
}
