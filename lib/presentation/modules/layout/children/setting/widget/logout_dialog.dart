import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/core/resources/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../auth/auth_view_model.dart';


class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        LocaleKeys.logOutDialog.tr(),
        style: TextStyles()
            .getRegularStyle(fontSize: 16.sp)
            .boldStyle()
            .customColor(AppColors.primaryColor),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
          child: !Provider.of<AuthViewModel>(context, listen: true).isLoading
              ? GestureDetector(
                  onTap: () {
                    Provider.of<AuthViewModel>(context, listen: false)
                        .logout(context);
                  },
                  child: Text(
                    LocaleKeys.confirm.tr(),
                    style: TextStyles()
                        .getRegularStyle(fontSize: 16.sp)
                        .boldStyle()
                        .customColor(AppColors.errorColor),
                  ))
              : SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
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
  }
}
