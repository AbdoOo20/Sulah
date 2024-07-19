import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/presentation/modules/layout/children/offers/offer%20view%20model.dart';
import 'package:khedmaty/presentation/modules/layout/children/offers/widgets/offer%20dialog.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/resources/locale_keys.g.dart';
import '../../../../../../data/datasource/locale/database_provider.dart';
import '../../../../../component/svg_icon.dart';

class OfferItem extends StatefulWidget {
  ProductOffer product;
  bool isOffer;

  OfferItem(this.product, this.isOffer, {Key? key}) : super(key: key);

  @override
  State<OfferItem> createState() => _OfferItemState();
}

class _OfferItemState extends State<OfferItem> {
  late OfferProvider offerProvider;

  @override
  Widget build(BuildContext context) {
    offerProvider = Provider.of(context);
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white),
              padding: EdgeInsets.only(
                  top: 12.h, bottom: 12.h, left: 8.w, right: 8.w),
              // margin: EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  Container(
                    color: AppColors.white,
                    padding: EdgeInsets.only(
                      top: 8.h,
                      bottom: 8.h,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 67.h,
                              width: 100.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: widget.product.image ?? '',
                                  placeholder: (context, url) =>
                                  new Center(
                                    child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 1,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      SVGIcon(
                                        Assets.errorProducts,
                                        height: 70.h,
                                        width: 70.w,
                                      ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.4,
                                  child: Text(
                                    widget.product.title,
                                    style: TextStyles()
                                        .getTitleStyle(
                                      fontSize: 14.sp,
                                    )
                                        .customColor(AppColors.black),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                                SizedBox(
                                  height: 19.h,
                                ),
                                Row(
                                  children: [
                                    SVGIcon(
                                      Assets.priceIcon,
                                      height: 20.h,
                                      width: 22.w,
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                            widget.product.price.toString(),
                                            style: TextStyles()
                                                .getTitleStyle(
                                              fontSize: 18.sp,
                                            )
                                                .customColor(AppColors.black),
                                          ),
                                          TextSpan(
                                            text: LocaleKeys.sar.tr(),
                                            style: TextStyles()
                                                .getRegularStyle(
                                              fontSize: 12.sp,
                                            )
                                                .customColor(AppColors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                if (widget.isOffer)
                                  for (int i = 0;
                                  i < widget.product.offers.length;
                                  i++)
                                    Column(
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: widget.product.offers[i]
                                                    .status ==
                                                    'accepted'
                                                    ? LocaleKeys.acceptOrder
                                                    .tr()
                                                    : widget.product.offers[i]
                                                    .status ==
                                                    'waiting' ? LocaleKeys
                                                    .haveOrder.tr() : LocaleKeys.refuseOrder.tr(),
                                                style: TextStyles()
                                                    .getTitleStyle(
                                                  fontSize: 8.sp,
                                                )
                                                    .customColor(
                                                  widget.product.offers[i]
                                                      .status ==
                                                      'accepted'
                                                      ?
                                                  AppColors.green : widget
                                                      .product.offers[i]
                                                      .status ==
                                                      'waiting'
                                                      ? AppColors.primaryColor
                                                      : AppColors.errorColor,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                " ${widget.product.offers[i]
                                                    .price} ${LocaleKeys.sar
                                                    .tr()}",
                                                style: TextStyles()
                                                    .getRegularStyle(
                                                  fontSize: 8.sp,
                                                )
                                                    .customColor(
                                                  widget.product.offers[i]
                                                      .status ==
                                                      'accepted'
                                                      ?
                                                  AppColors.green : widget
                                                      .product.offers[i]
                                                      .status ==
                                                      'waiting'
                                                      ? AppColors.primaryColor
                                                      : AppColors.errorColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (widget.product.offers[i].status ==
                                            'accepted')
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.product.offers[i].name,
                                                style: TextStyles()
                                                    .getTitleStyle(
                                                  fontSize: 9.sp,
                                                )
                                                    .customColor(
                                                  widget.product.offers[i]
                                                      .payment ==
                                                      'waiting'
                                                      ? AppColors.amber
                                                      : AppColors.green,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                widget.product.offers[i].phone,
                                                style: TextStyles()
                                                    .getTitleStyle(
                                                  fontSize: 9.sp,
                                                )
                                                    .customColor(
                                                  widget.product.offers[i]
                                                      .payment ==
                                                      'waiting'
                                                      ? AppColors.amber
                                                      : AppColors.green,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                widget.product.offers[i].payment ==
                                                    'waiting'
                                                    ? LocaleKeys.paymentWait.tr()
                                                    : LocaleKeys.paymentAccept.tr(),
                                                style: TextStyles()
                                                    .getTitleStyle(
                                                  fontSize: 12.sp,
                                                )
                                                    .customColor(
                                                  widget.product.offers[i]
                                                      .payment ==
                                                      'waiting'
                                                      ? AppColors.amber
                                                      : AppColors.green,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        if (!widget.product.offers.any((element){
                                          return element.status == 'accepted';
                                        }) && widget.product.offers[i].status == 'waiting')
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  offerProvider
                                                      .acceptOrRejectOffer(
                                                      'accepted',
                                                      widget.product
                                                          .offers[i].id,
                                                      context);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(5.r),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        16.r),
                                                    color:
                                                    AppColors.green,
                                                  ),
                                                  child: Text(
                                                    LocaleKeys.accept.tr(),
                                                    style: TextStyles()
                                                        .getRegularStyle(
                                                      fontSize: 11.sp,
                                                    )
                                                        .customColor(
                                                        AppColors.white),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 20.w),
                                              InkWell(
                                                onTap: () {
                                                  offerProvider
                                                      .acceptOrRejectOffer(
                                                      'rejected',
                                                      widget.product
                                                          .offers[i].id,
                                                      context);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(5.r),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        16.r),
                                                    color:
                                                    AppColors.errorColor,
                                                  ),
                                                  child: Text(
                                                    LocaleKeys.refused.tr(),
                                                    style: TextStyles()
                                                        .getRegularStyle(
                                                      fontSize: 11.sp,
                                                    )
                                                        .customColor(
                                                        AppColors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                              ],
                            ),
                          ],
                        ),
                        if (!widget.isOffer)
                          IconButton(
                            onPressed: () {
                              offerDialog(
                                  context, offerProvider, widget.product);
                            },
                            icon: Icon(Icons.add_circle,
                                color: AppColors.primaryColor),
                          ),
                        if (widget.isOffer && widget.product.offers.isEmpty)
                          IconButton(
                            onPressed: () {
                              offerProvider.deleteOffer(
                                  widget.product.id, context);
                            },
                            icon: Icon(Icons.delete,
                                color: AppColors.primaryColor),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
