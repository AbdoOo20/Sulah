import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/res/text_styles.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../component/svg_icon.dart';
import '../../../../../../auth/auth_view_model.dart';


class CardPop extends StatefulWidget {
  const CardPop({Key? key}) : super(key: key);

  @override
  _CardPopState createState() => _CardPopState();
}
class _CardPopState extends State<CardPop> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pop(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      content: Builder(
        builder: (context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Container(
            color: AppColors.black,
            height: height - 670,
            width: width - 30,
            padding: EdgeInsets.only(
              top: 16.h,
              bottom: 20.h,
              right: 24.w,
              left: 24.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Dear'.tr(),
                            style: const TextStyle()
                                .regularStyle()
                                .customColor(AppColors.white),
                          ),
                          Text(
                            Provider.of<AuthViewModel>(context, listen: true)
                                .saveUserData
                                .getUserData()
                                ?.data
                                ?.name
                                ?.split('')
                                .first ??
                                '',
                            style: const TextStyle()
                                .regularStyle()
                                .customColor(AppColors.white),
                          ),
                          Text(
                            'productAddedCart'.tr(),
                            style: const TextStyle()
                                .regularStyle()
                                .customColor(AppColors.white),
                          ),
                        ],
                      ),
                      SVGIcon(
                        Assets.closePop,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.w),
                Container(
                  width: 311.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: AppColors.gray,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
