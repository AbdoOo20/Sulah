import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/core/resources/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/app_colors.dart';
import '../../../../../../../../data/datasource/locale/database_model.dart';
import '../../../../../../../../data/datasource/locale/database_provider.dart';
import '../../../../../../auth/auth_view_model.dart';


class AddFromAnotherStoreDialog extends StatelessWidget {
  const AddFromAnotherStoreDialog({
    super.key, required this.cartItems,
  });
final CartItems cartItems;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        'addedFromAnother'.tr(),
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
                Provider.of<CartProvider>(context, listen: false).cartItems=[];
                Provider.of<CartProvider>(context, listen: false).addToCart(cartItems, context);
                Navigator.of(context).pop();
              },
              child: Text(
                LocaleKeys.confirm.tr(),
                style: TextStyles()
                    .getRegularStyle(fontSize: 16.sp)
                    .boldStyle()
                    .customColor(AppColors.errorColor),
              )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.w),
          child: !Provider.of<AuthViewModel>(context, listen: true).isLoading
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    LocaleKeys.cancel.tr(),
                    style: TextStyles()
                        .getRegularStyle(fontSize: 16.sp)
                        .boldStyle()
                        .customColor(AppColors.primaryColor),
                  ))
              : SizedBox(
                  height: 24.h,
                  width: 24.w,
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                  )),
        ),
      ],
    );
  }
}
