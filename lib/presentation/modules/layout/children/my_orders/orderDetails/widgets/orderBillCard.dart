import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/data/model/response/oneOrderModel.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/res/text_styles.dart';
import '../../../../../../../core/resources/app_colors.dart';
import '../../../../../../../core/resources/locale_keys.g.dart';
import '../../../../../../../data/model/response/myOrdersModel.dart';
import '../../../../../../component/seperator.dart';
import 'ListproductsPrice.dart';


class OrderBillCard extends StatefulWidget {
  const OrderBillCard(
      {Key? key,
        required this.oneOrderModel,
      })
      : super(key: key);
  final MyOneOrderModel? oneOrderModel;

  @override
  State<OrderBillCard> createState() => _BillCardState();
}

class _BillCardState extends State<OrderBillCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.grayLight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.products.tr(),
            style: TextStyles()
                .getTitleStyle(
              fontSize: 12.sp,)
                .customColor(AppColors.gray),
          ),
          ListProductsPrice(oneOrderModel: widget.oneOrderModel),
            MySeparator(color: Colors.grey.shade400,),
          Padding(
            padding: EdgeInsets.only(top:8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.theTotal.tr(),
                  style: TextStyles()
                      .getTitleStyle(
                    fontSize: 14.sp,
                  )
                      .customColor(AppColors.black),
                ),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '${(double.parse((widget.oneOrderModel?.total?? 0.0).toString())).toPrecision(1)}',
                        style: TextStyles()
                            .getTitleStyle(
                          fontSize: 20.sp,
                        )
                            .customColor(AppColors.primaryColor),
                      ),
                      TextSpan(
                        text: LocaleKeys.sar.tr(),
                        style: TextStyles()
                            .getRegularStyle(
                          fontSize: 18.sp,
                        )
                            .customColor(AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
