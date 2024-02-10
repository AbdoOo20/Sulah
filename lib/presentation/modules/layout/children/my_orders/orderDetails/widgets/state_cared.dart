import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/presentation/component/component.dart';

import '../../../../../../../core/res/text_styles.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../component/svg_icon.dart';
import 'edit_order_button.dart';
import 'state_order.dart';

class CustomStateCared extends StatefulWidget {
  const CustomStateCared({
    Key? key,
    required this.title,
    // required this.userId,  required this.image, required this.phone, required this.name, required this.driverID,
    required this.storeId,
    required this.orderId,
  }) : super(key: key);
  final String title;
  final String orderId;
  // final String image;
  // final String phone;
  // final String name;
  // final String driverID;
  final String storeId;
  // final String userId;

  @override
  State<CustomStateCared> createState() => _CustomStateCaredState();
}

class _CustomStateCaredState extends State<CustomStateCared> {


  @override
  Widget build(BuildContext context) {
    return
      Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 19.h),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), color: AppColors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SVGIcon(
                 widget.title == LocaleKeys.approved
                    ? Assets.received
                    : widget.title == LocaleKeys.preparing
                    ? Assets.preparing
                    : widget.title == LocaleKeys.representative
                    ?Assets.representative
                    : widget.title == LocaleKeys.progress
                    ? Assets.progress
                    : widget.title == LocaleKeys.prepared
                    ? Assets.progress
                     : widget.title == 'orderAccepted'
                    ? Assets.progress
                     : widget.title == 'isDeliver'
                    ? Assets.progress
                    : widget.title == LocaleKeys.done
                    ?Assets.done
                    : widget.title == LocaleKeys.received
                    ? Assets.received
                    : Assets.canceledOrder,///   هنا هلتضيف صوره حمره
                width: 48.w,
                height: 48.h,
              ),
              HorizontalSpace(8.w),
              Text(
                widget.title.tr(),
                style: TextStyles()
                    .getRegularStyle(fontSize: 14.sp)
                    .customColor(AppColors.gray),
              ),
            ],
          ),
          VerticalSpace(10.h),
          StateOrder(state: widget.title),
          if (widget.title == LocaleKeys.received)
            EditOrderButton(orderId: widget.orderId,),
          // if (widget.title == LocaleKeys.representative ||
          //     widget.title == LocaleKeys.progress)
            // PhoneCared(
            //   name: widget.name, phone: widget.phone,
            //   image:widget.image, userId: widget.userId,
            //   driverId: widget.driverID,
            //   storeId: widget.storeId,
            //   orderId: widget.orderId,)
        ],
      ),
    );
  }
}



