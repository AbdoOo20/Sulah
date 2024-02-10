import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/resources/resources.dart';
import 'package:khedmaty/presentation/component/component.dart';

import '../../../../../../../core/res/text_styles.dart';
import '../../../../../../../data/model/response/myOrdersModel.dart';
import '../../../../../../component/svg_icon.dart';


class CustomCaredTittle extends StatelessWidget {
  const CustomCaredTittle({
    super.key, required this.data,

  });

  final MyOneOrderModel? data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:16.w),
      padding: EdgeInsets.only(right: 16.w, left: 16.w,top: 16.h,bottom: 16.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.main30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SVGIcon(
                Assets.locationIcon1,
                color: AppColors.primaryColor,
              ),
              HorizontalSpace(12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    // onTap: (){
                    //   double lat  = 0.0;
                    //   double lang  = 0.0;
                    //   if( data?.receiveType != 'store'){
                    //     lat = data?.latitude ?? 0.0;
                    //     lang = data?.longitude ?? 0.0;
                    //   }else{
                    //     lat = double.parse(data?.store?.store?.latitude.toString() ?? "0.0");
                    //     lang = double.parse(data?.store?.store?.longitude.toString() ?? "0.0");
                    //   }
                    //   SocialMediaHelper().openGoogleMap(lat,lang);
                    // },
                    child: Text(
                      LocaleKeys.deliveryAddress.tr(),
                      style: TextStyles()
                          .getRegularStyle(fontSize: 12.sp)
                          .customColor(AppColors.gray),
                    ),
                  ),
                  VerticalSpace(3.h),
                  SizedBox(
                    width:MediaQuery.of(context).size.width*0.7,
                    child: Text(
         (data?.address!=null)? data?.address.toString()??'':LocaleKeys.pickUpFromStore.tr(),
                      style: TextStyles()
                          .getRegularStyle(fontSize: 14.sp)
                          .customColor(AppColors.black),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
          VerticalSpace(20.h),
          Row(
            children: [
              const SVGIcon(
                Assets.cashWallet,
                color: AppColors.primaryColor,
              ),
              HorizontalSpace(12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.paymentMethod.tr(),
                    style: TextStyles()
                        .getRegularStyle(fontSize: 12.sp)
                        .customColor(AppColors.gray),
                  ),
                  VerticalSpace(3.h),
                  Text(
                    (data?.paymentMethod??'').tr(),
                    style: TextStyles()
                        .getRegularStyle(fontSize: 14.sp)
                        .customColor(AppColors.black),
                  ),
                ],
              ),
            ],
          ),
          VerticalSpace(20.h),
          Row(
            children: [
              const SVGIcon(
                Assets.detailes,
                color: AppColors.primaryColor,
              ),
              HorizontalSpace(12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    LocaleKeys.notes.tr(),
                    style: TextStyles()
                        .getRegularStyle(fontSize: 12.sp)
                        .customColor(AppColors.gray),
                  ),
                  VerticalSpace(3.h),
                  SizedBox(
                    width:MediaQuery.of(context).size.width*0.7,
                    child: Text(
                      data?.notes??'',
                      style: TextStyles()
                          .getRegularStyle(fontSize: 14.sp)
                          .customColor(AppColors.black),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
