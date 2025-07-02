import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/core/res/text_styles.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/locale_keys.g.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../component/spaces.dart';
import '../../auth_view_model.dart';

class InvitedPart extends StatefulWidget {
  const InvitedPart({
    super.key,
  });

  @override
  State<InvitedPart> createState() => _InvitedPartState();
}

class _InvitedPartState extends State<InvitedPart> {
  @override
  Widget build(BuildContext context) {
    bool isClicked =
        Provider.of<AuthViewModel>(context, listen: false).isClicked;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Provider.of<AuthViewModel>(context, listen: false)
                .isClickedAction();
            setState(() {});
            if (kDebugMode) {
              print('$isClicked');
            }
          },
          child: Container(
            width: 24.w,
            height: 24.h,
            decoration: ShapeDecoration(
              color: isClicked ? AppColors.primaryColor : Colors.white,
              shape: RoundedRectangleBorder(
                side: isClicked
                    ? BorderSide(width: 0.50.w, color: AppColors.primaryColor)
                    : BorderSide(width: 0.50.w, color: AppColors.gray),
                borderRadius: BorderRadius.circular(kFormRadiusSmall),
              ),
            ),
            child: isClicked
                ? Center(
                    child: Icon(
                      Icons.check_rounded,
                      size: 18.r,
                      color: AppColors.white,
                    ),
                  )
                : const SizedBox(),
          ),
        ),
        HorizontalSpace(AppSize.s8.w),
        Text(LocaleKeys.invited.tr(), style: const TextStyle().regularStyle()),
      ],
    );
  }
}
