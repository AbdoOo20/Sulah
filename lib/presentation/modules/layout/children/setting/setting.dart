import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/presentation/modules/auth/login/login.dart';
import 'package:sulah/presentation/modules/layout/children/setting/widget/delete_account_dialog.dart';
import 'package:sulah/presentation/modules/layout/children/setting/widget/logout_dialog.dart';

import '../../../../../core/helper/socialMediaHelper.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/routing/route.dart';
import '../../../../../data/app_urls/app_url.dart';
import '../../../../../data/repository/SaveUserData.dart';
import '../../../../../injection.dart';
import '../../../../component/component.dart';

import '../../../../component/svg_icon.dart';
import 'about_app/about_app.dart';
import 'change_language/change_language_sheet.dart';
import 'connect_Us/connect_us.dart';
import 'favorite/favorite.dart';
import 'modify_the_account/modify_the_account.dart';
import 'web_view/web_view_screen.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  SaveUserData getUserId = getIt();

  @override
  Widget build(BuildContext context) {
    var lang = getUserId.getLang() ?? "ar";
    return Padding(
      padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 10.h),
      child: ListAnimator(
        children: [
          Container(
              width: double.infinity,
              color: AppColors.white,
              height: 56.h,
              padding: EdgeInsets.symmetric(vertical: 14.5.h, horizontal: 16.w),
              margin: EdgeInsets.only(bottom: 12.h),
              child: Text(
                LocaleKeys.myAccount.tr(),
                style: TextStyles()
                    .getTitleStyle(fontSize: 18.sp)
                    .customColor(AppColors.black),
              )),
          Container(
              padding: EdgeInsets.all(8.r),
              // height: 374.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.main10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Text(
                      LocaleKeys.setting.tr(),
                      style: TextStyles()
                          .getTitleStyle(fontSize: 12.sp)
                          .customColor(AppColors.gray),
                    ),
                  ),
                  _buildItem(context,
                      image: Assets.modifyTheAccount,
                      title: tr(LocaleKeys.modifyTheAccount), onTap: () {
                    // (getUserId.getUserData()?.data?.user?.id != null) ?
                    push(ModifyTheAccount());
                    // : pushAndRemoveUntil(Login());
                  }),
                  _buildItem(context,
                      image: Assets.fav,
                      title: tr(LocaleKeys.favorite), onTap: () {
                    // (getUserId.getUserData()?.data?.user?.id != null) ?
                    push(Favorite());
                    // : pushAndRemoveUntil(Login());
                  }),
                  _buildItem(context,
                      image: Assets.language,
                      title: tr(LocaleKeys.language), onTap: () {
                    showChangeLanguageSheet(context);
                  }),
                  _buildItem(
                    context,
                    image: Assets.connectUs,
                    title: tr(LocaleKeys.connectUs),
                    onTap: () {
                      push(ConnectUs());
                    },
                  ),
                  _buildItem(
                    context,
                    image: Assets.aboutApp,
                    title: tr(LocaleKeys.aboutApp),
                    onTap: () {
                      push(AboutApp());
                    },
                  ),
                  _buildItem(
                    context,
                    image: Assets.appEvaluation,
                    title: tr(LocaleKeys.appEvaluation),
                    onTap: () {
                      // SocialMediaHelper().openStore("com.apps.sulah", "");
                    },
                  ),
                  _buildItem(
                    context,
                    image: Assets.privacyPolicy,
                    title: tr(LocaleKeys.privacyPolicy.tr()),
                    onTap: () {
                      // push(WebViewScreen(
                      //   title: LocaleKeys.privacyPolicy.tr(),
                      //   url:
                      //       '${AppURL.kBaseURL}webView/privacy_policy?lang=${lang}',
                      // ));
                    },
                  ),
                  _buildItem(
                    context,
                    image: Assets.termsAndConditions,
                    title: tr(LocaleKeys.termsAndConditions.tr()),
                    onTap: () {
                      // push(WebViewScreen(
                      //   title: LocaleKeys.termsAndConditions.tr(),
                      //   url:
                      //       '${AppURL.kBaseURL}webView/termis_condition?lang=${lang}',
                      // ));
                    },
                  ),
                  (getUserId.getUserData()?.data?.id != null)
                      ? _buildItem(
                          context,
                          image: Assets.deleteAnAccount,
                          title: tr(LocaleKeys.deleteAnAccount),
                          onTap: () {
                            createAlertDialogDeleteAccount();
                          },
                        )
                      : const SizedBox(),
                ],
              )),
          CustomTextButton(
            onPressed: () {
              (getUserId.getUserData()?.data?.id != null)
                  ? createAlertDialogLogout()
                  : pushAndRemoveUntil(const Login());
            },
            text: (getUserId.getUserData()?.data?.id != null)
                ? tr(LocaleKeys.logOut)
                : 'logingin'.tr(),
            textColor: AppColors.gray,
            textSize: 14.sp,
          ),
        ],
      ),
    );
  }

  void createAlertDialogLogout() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const LogoutDialog();
        });
  }

  Future<dynamic> showChangeLanguageSheet(BuildContext context) async {
    return showModalBottomSheet(
      // expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const SafeArea(child: ChangeLanguageSheet()),
    );
  }

  void createAlertDialogDeleteAccount() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const DeleteAccountDialog();
        });
  }
}

_buildItem(BuildContext context,
    {required String image,
    required String title,
    double? imageWidth,
    double? imageHeight,
    GestureTapCallback? onTap}) {
  return ListTile(
    onTap: onTap,
    minVerticalPadding: 0,
    contentPadding: const EdgeInsets.all(0),
    trailing: Icon(
      Icons.arrow_forward_ios,
      size: 16.r,
      color: AppColors.black,
    ),
    title: Text(
      title.tr(),
      style: TextStyles().getRegularStyle().customColor(
          image == Assets.deleteAnAccount
              ? AppColors.errorColor
              : AppColors.black),
    ),
    leading: SVGIcon(image,
        width: imageWidth ?? 36.w,
        height: imageHeight ?? 36.h,
        color: image == Assets.deleteAnAccount
            ? AppColors.errorColor
            : AppColors.primaryColor),
  );
}
