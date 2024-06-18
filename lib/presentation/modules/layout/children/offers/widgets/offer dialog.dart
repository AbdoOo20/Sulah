import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/presentation/component/component.dart';
import 'package:khedmaty/presentation/modules/layout/children/offers/offer%20view%20model.dart';

import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/resources/locale_keys.g.dart';
import '../../../../../../core/utils/showToast.dart';

Future<void> offerDialog(
    BuildContext context, OfferProvider offerProvider, ProductOffer product) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          LocaleKeys.enterPriceTitle.tr(),
          style: TextStyles()
              .getRegularStyle(
                fontSize: 20.sp,
              )
              .customColor(AppColors.primaryColor),
        ),
        content: CustomTextFieldNormal(
          hint: LocaleKeys.enterPrice.tr(),
          textInputType: TextInputType.number,
          controller: offerProvider.priceController,
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              LocaleKeys.cancel.tr(),
              style: TextStyles()
                  .getRegularStyle(
                    fontSize: 14.sp,
                  )
                  .customColor(AppColors.primaryColor),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              LocaleKeys.add.tr(),
              style: TextStyles()
                  .getRegularStyle(
                    fontSize: 14.sp,
                  )
                  .customColor(AppColors.primaryColor),
            ),
            onPressed: () {
              int p = int.parse(offerProvider.priceController.text.trim());
              Navigator.pop(context);
              ToastUtils.showToast(LocaleKeys.wait.tr());
              offerProvider.addOffer(
                p,
                product.orderID,
                product.productID,
                product.amount,
              ).then((value){
                offerProvider.getMyOrders(context);
              });
            },
          ),
        ],
      );
    },
  );
}
