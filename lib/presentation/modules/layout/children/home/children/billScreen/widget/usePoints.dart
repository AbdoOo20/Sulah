import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/app_colors.dart';
import '../../../../../../../../core/resources/locale_keys.g.dart';
import '../../shoppingCard/shopping_cared_view_model.dart';

class UsePoints extends StatefulWidget {
  const UsePoints({Key? key, required this.point, required this.pointDiscount,required this.isFromDetails}) : super(key: key);
  final String point;
  final String pointDiscount;
  final bool isFromDetails;

  @override
  State<UsePoints> createState() => _UsePointsState();
}

class _UsePointsState extends State<UsePoints> {
  bool discount =false;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            !widget.isFromDetails ?
            InkWell(onTap: (){setState(() {
              discount = !discount;
              Provider.of<ShoppingCaredViewModel>(context, listen: false).isPointsSet=discount;
            });},
              child: Container(height: 25.h,width:25.w,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),color:(discount==true)? AppColors.primaryColor:AppColors.white),
                child: Center(child: Icon((discount==true)?Icons.done:Icons.transcribe,color: AppColors.white,size: 18.r,),)
              )
            ):SizedBox(),
            SizedBox(width: 10.w,),
            Column(
              children: [
                Text(
                  LocaleKeys.usePoints.tr(),
                  style: TextStyles()
                      .getRegularStyle(
                    fontSize: 12.sp,
                  )
                      .customColor(AppColors.gray),
                ),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '(${widget.point})',
                        style: TextStyles()
                            .getTitleStyle(
                          fontSize: 18.sp,
                        )
                            .customColor(
                            AppColors.black),
                      ),
                      TextSpan(
                        text: LocaleKeys.point.tr(),
                        style: TextStyles()
                            .getRegularStyle(
                          fontSize: 10.sp,
                        )
                            .customColor(
                            AppColors.black),
                      ),
                    ],
                  ),
                ),

              ],),
          ],
        ),

        Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: widget.pointDiscount,
                style: TextStyles()
                    .getTitleStyle(
                  fontSize: 18.sp,
                )
                    .customColor(
                    AppColors.black),
              ),
              TextSpan(
                text: LocaleKeys.sar.tr(),
                style: TextStyles()
                    .getRegularStyle(
                  fontSize: 12.sp,
                )
                    .customColor(
                    AppColors.gray),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
