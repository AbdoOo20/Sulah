import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/data/repository/SaveUserData.dart';
import 'package:sulah/injection.dart';

import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../component/svg_icon.dart';


class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({Key? key,}) : super(key: key);

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  SaveUserData saveUserData = getIt();
  @override
  Widget build(BuildContext context) {
    print('sssssssssssssssssss${saveUserData.getDistance()}');
    return Column(
      children: [
        Container(
          height: 64.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 45.w,
                    child: SVGIcon(
                      Assets.locationIcon1,
                      color: AppColors.primaryColor,
                      width: (24.w),
                      height: (24.h)
                    ),
                  ),
                  SizedBox(
                    width:MediaQuery.of(context).size.width*0.6.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: RichText(
                          overflow: TextOverflow.ellipsis,
                          strutStyle: StrutStyle(fontSize: 12.0.sp),
                          text: TextSpan(
                              style: TextStyles()
                                  .getRegularStyle(fontSize: 12.sp)
                                  .customColor(AppColors.gray),
                              text: LocaleKeys.deliveryAddress.tr()),
                        )),
                        Flexible(
                            child: RichText(
                          overflow: TextOverflow.ellipsis,
                          strutStyle: StrutStyle(fontSize: 12.0.sp),
                          text: TextSpan(
                            style: TextStyles()
                                .getRegularStyle(fontSize: 14.sp)
                                .customColor(AppColors.black),
                            text: saveUserData.getDistance(),
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15.r,
              ),
            ],
          ),
        ),
        Container(color: AppColors.grayLight,height: .5.h,)
      ],
    );
  }
}
