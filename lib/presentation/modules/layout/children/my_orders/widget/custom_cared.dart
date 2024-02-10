import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/res/text_styles.dart';

import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/routing/route.dart';
import '../../../../../../data/model/response/myOrdersModel.dart';
import '../../../../../component/component.dart';
import '../../../../../component/svg_icon.dart';
import '../orderDetails/my_order_details.dart';

class CustomCared extends StatefulWidget {
  const CustomCared({
    super.key,
    required this.type,
     this.data,
  });

  final MyOneOrderModel? data;
  final String? type;

  @override
  State<CustomCared> createState() => _CustomCaredState();
}

class _CustomCaredState extends State<CustomCared> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.grayLight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
               '#${widget.data?.id??'id'}',
                style: const TextStyle()
                    .titleStyle(fontSize: 18.sp)
                    .customColor(AppColors.primaryColor),
              ),
              InkWell(
                onTap: () {
                 push(MyOrderDetails(orderId: widget.data?.id.toString(),));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      LocaleKeys.details.tr(),
                      style: const TextStyle()
                          .bodyStyle(fontSize: 14.sp)
                          .customColor(AppColors.primaryColor),
                    ),
                    HorizontalSpace(8.w),
                  ],
                ),
              ),
            ],
          ),
          VerticalSpace(16.h),
          Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SVGIcon(
                    Assets.date1,color: AppColors.black,
                  ),
                  HorizontalSpace(10.w),
                  Text(
                    '${widget.data?.createdAt??''}',
                    style: TextStyles()
                        .getRegularStyle()
                        .customColor(AppColors.black),
                  ),
                  // Text(
                  //   '${widget.data?.time??'time'}',
                  //   style: const TextStyle().bodyStyle(),
                  // ),
                ],
              ),

            ],
          ),
          VerticalSpace(16.h),
          Row(
            children: [
              const SVGIcon(
                Assets.locationIcon1,color: AppColors.black,
              ),
              HorizontalSpace(10.w),
              Expanded(
                child: Text(
                  (widget.data?.address!=null)?   '${widget.data?.address}':LocaleKeys.pickUpFromStore.tr(),
                  style: TextStyles()
                      .getRegularStyle(fontSize: 14.sp)
                      .customColor(AppColors.black),
                  softWrap: false,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          (widget.type=='new'||widget.type=='current')?SizedBox():  Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Container(
                     padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
                  //  height: 41.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grayLight),
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.white),
                    child: Center(
                      child: Text(
                      widget.data?.status == 'new' ?LocaleKeys.received.tr():
                      widget.data?.status  == 'accepted'?LocaleKeys.approved.tr():
                      widget.data?.status  == 'refused' ?LocaleKeys.orderCanceledFromStore.tr():
                      widget.data?.status  == 'on_progress' ?LocaleKeys.preparing.tr():
                      widget.data?.status  == 'on_way' ?LocaleKeys.representative.tr():
                      widget.data?.status  == 'delivery_progress' ?LocaleKeys.progress.tr():
                      widget.data?.status  == 'ended' ?LocaleKeys.done.tr():
                      widget.data?.status  == 'canceled' ?LocaleKeys.orderCanceled.tr():
                      widget.data?.status  == 'progress_done' ?LocaleKeys.done.tr():
                      widget.data?.status  == 'driver_canceled' ?LocaleKeys.RequestDriverCancelled.tr():
                          // orderData.oneOrderModel?.data?.status == 'delivered' ?LocaleKeys.done:
                          LocaleKeys.done.tr(),
                        style: TextStyles()
                            .getRegularStyle(fontSize: 14.sp)
                            .customColor(AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}


