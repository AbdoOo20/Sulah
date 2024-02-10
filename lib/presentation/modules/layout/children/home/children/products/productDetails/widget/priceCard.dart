import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/resources/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../../core/resources/app_colors.dart';
import '../../../../../../../../../core/resources/resources.dart';
import '../../../../../../../../../data/model/response/one_product_model.dart';

import '../../../../../../../../component/svg_icon.dart';
import '../../productsViewModel.dart';

class PriceCard extends StatefulWidget {
  const PriceCard({Key? key, required this.data}) : super(key: key);
  final OneProduct? data;

  @override
  _PriceCardState createState() => _PriceCardState();
}

class _PriceCardState extends State<PriceCard> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductsViewModel>(context, listen: false);
    return Container(
      //height: 136.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.grayLight),
      padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 8.w, right: 8.w),
      child: Column(
        children: [
          Container(
            height: 52.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.white),
            padding:
                EdgeInsets.only(top: 8.h, bottom: 8.h, left: 16.w, right: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SVGIcon(
                      Assets.price,
                      height: 20.h,
                      width: 22.w,
                    ),
                    Text(LocaleKeys.thePrice.tr(),
                        style: TextStyles().getRegularStyle(
                          fontSize: 14.sp,
                        )
                        // .customColor(AppColors.primaryColor),
                        ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                            child: widget.data?.productsOffers != null
                                ? Text.rich(
                                    TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                            text:
                                                '${widget.data?.oldPrice.toString() ?? ""}',
                                            // text: '${double.parse(widget.data?.oldPrice.toString() ?? "").toPrecision(1)}',
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 12.sp,
                                              color: AppColors.gray,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                        TextSpan(
                                            text: LocaleKeys.sar.tr(),
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 12.sp,
                                              color: AppColors.gray,
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                      ],
                                    ),
                                  )
                                : SizedBox()),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: widget.data?.price.toString() ?? "",
                                style: TextStyles()
                                    .getTitleStyle(
                                      fontSize: 16.sp,
                                    )
                                    .customColor(AppColors.primaryColor),
                              ),
                              TextSpan(
                                text: LocaleKeys.sar.tr(),
                                style: TextStyles()
                                    .getRegularStyle(
                                      fontSize: 10.sp,
                                    )
                                    .customColor(AppColors.primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                padding: EdgeInsets.all(1.r),
                onPressed: () {
                  if (provider.quantity <= 0) {
                    return;
                  } else {
                    provider.quantity = provider.quantity - 1;
                    provider.collectTotalPrice(widget.data?.price ?? 0, provider.quantity);
                  }
                },
                icon: Icon(
                  Icons.remove,
                  color: AppColors.black,
                  size: 40.r,
                ),
              ),
              Container(
                height: 52.h,
                width: 200.w,
                margin: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.white),
                padding: EdgeInsets.only(
                    top: 8.h, bottom: 8.h, left: 16.w, right: 16.w),
                child: Center(
                    child: Text(
                  '${Provider.of<ProductsViewModel>(context, listen: true).quantity}',
                  style: TextStyles()
                      .getTitleStyle(
                        fontSize: 18.sp,
                      )
                      .customColor(AppColors.black),
                )),
              ),
              IconButton(
                padding: EdgeInsets.all(1.r),
                onPressed: () {
                  setState(() {
                    provider.quantity = provider.quantity + 1;
                    provider.collectTotalPrice(widget.data?.price ?? 0, provider.quantity);
                  });
                },
                icon: Icon(
                  Icons.add,
                  color: AppColors.black,
                  size: 40.r,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
