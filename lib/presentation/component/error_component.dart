
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';

import '../../../core/resources/app_assets.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/locale_keys.g.dart';
import '../../../core/resources/values_manager.dart';
import 'component.dart';

class ErrorComponent extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const ErrorComponent({required this.errorMessage, required this.onRetry, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(Assets.cross, width: deviceWidth * 0.4, height: deviceWidth * 0.4, fit: BoxFit.cover),
          VerticalSpace(8.h),
          CustomText(errorMessage, textAlign: TextAlign.center),
          VerticalSpace(8.h),
          CustomButton(
            color: Theme.of(context).primaryColor,
            isRounded: true,
            isOutlined: true,
            widerPadding: true,
            onTap: onRetry,
            child:  CustomText(tr(LocaleKeys.retry), color: Theme.of(context).primaryColor,fontWeight: FontWeightManager.bold),
          ),
        ],
      ),
    );
  }
}
