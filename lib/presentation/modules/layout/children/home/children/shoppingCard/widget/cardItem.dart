import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../../data/datasource/locale/database_model.dart';
import '../../../../../../../../data/datasource/locale/database_provider.dart';
import '../../../../../../../component/seperator.dart';
import '../../../../../../../component/svg_icon.dart';


class CardItem extends StatefulWidget {
  final CartItems cartItems;

  const CardItem({Key? key, required this.cartItems,}) : super(key: key);


  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
@override
  void initState() {
    super.initState();
    collectTotalPrice(widget.cartItems);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, child) {
     return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r), color: AppColors.white),
          padding:
              EdgeInsets.only(top: 12.h, bottom: 12.h, left: 8.w, right: 8.w),
          // margin: EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              Container(
                color: AppColors.white,
                padding:
                    EdgeInsets.only(top: 8.h, bottom: 8.h,),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 67.h,
                          width: 100.w,
                          child: ClipRRect(borderRadius: BorderRadius.circular(16.r),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: widget.cartItems.image ?? '',
                              placeholder: (context, url) =>
                              new Center(child: SizedBox(width:20,height:20,child: CircularProgressIndicator(strokeWidth: 1,))),
                              errorWidget: (context, url, error) => SVGIcon(
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
                              width: MediaQuery.of(context).size.width *0.4,
                              child: Text(
                                widget.cartItems.name,
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
                                        text: '${widget.cartItems.price.toPrecision(1)}',
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
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                        onTap: () {
                          cart.deleteItem(widget.cartItems);
                          collectTotalPrice(widget.cartItems);
                        },
                        child: const SVGIcon(Assets.deleteIcon)),
                  ],
                ),
              ),
              // ListView.builder(
              //   padding: EdgeInsets.only(right: 116.w,left: 20.w),
              //     physics: NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     itemCount:widget.cartItems.additionsCart.length,
              //     itemBuilder: (context, index) {
              //       return  Padding(
              //         padding: EdgeInsets.symmetric(vertical: 5.h),
              //         child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               widget.cartItems.additionsCart[index].additionsName,
              //               style: TextStyles()
              //                   .getRegularStyle(fontSize: 14.sp)
              //                   .customColor(AppColors.gray),
              //             ),
              //             Text.rich(
              //               TextSpan(
              //                 children: <TextSpan>[
              //                   TextSpan(
              //                     text: widget.cartItems.additionsCart[index].additionsPrice.toString(),
              //                     style: TextStyles()
              //                         .getTitleStyle(fontSize: 16.sp,)
              //                         .customColor(AppColors.black),),
              //                   TextSpan(text: LocaleKeys.sar.tr(), style: TextStyles()
              //                       .getRegularStyle(fontSize: 10.sp,)
              //                       .customColor(AppColors.black),
              //                   ),
              //
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     }),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 212.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: AppColors.grayLight),
                          child: IconButton(
                            padding: EdgeInsets.all(1.r),
                            onPressed: () {
                              if (widget.cartItems.quantity > 1) {
                                setState(() => --widget.cartItems.quantity);
                                cart.updateItem();
                                collectTotalPrice(widget.cartItems);
                              }
                            },
                            icon: Icon(
                              Icons.remove,
                              color: AppColors.black,
                              size: 30.r,
                            ),
                          ),
                        ),
                        Container(
                          height: 48.h,
                          width: 114.w,
                          margin: EdgeInsets.all(8.r),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                  width: 1.w, color: AppColors.grayLight),
                              color: AppColors.white),
                          padding: EdgeInsets.only(
                              top: 8.h, bottom: 8.h, left: 16.w, right: 16.w),
                          child: Center(
                              child: Text(
                            '${widget.cartItems.quantity}',
                            style: TextStyles()
                                .getTitleStyle(
                                  fontSize: 18.sp,
                                )
                                .customColor(AppColors.black),
                          )),
                        ),
                        Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: AppColors.grayLight,
                          ),
                          child: IconButton(
                            padding: EdgeInsets.all(1.r),
                            onPressed: () => setState(() {
                              ++widget.cartItems.quantity;
                              cart.updateItem();
                              collectTotalPrice(widget.cartItems);
                            }),
                            icon: Icon(
                              Icons.add,
                              color: AppColors.black,
                              size: 30.r,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.theTotal.tr(),
                        style: TextStyles()
                            .getRegularStyle(
                              fontSize: 14.sp,
                            )
                            .customColor(AppColors.black),
                      ),
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "${totalOneProduct}",
                                  // text: "${double.parse(((widget.cartItems.price) * (widget.cartItems.quantity)).toString()).toPrecision(1)}",
                                  style: TextStyles()
                                      .getTitleStyle(
                                        fontSize: 18.sp,
                                      )
                                      .customColor(AppColors.primaryColor),
                                ),
                                TextSpan(
                                  text: LocaleKeys.sar.tr(),
                                  style: TextStyles()
                                      .getRegularStyle(
                                        fontSize: 12.sp,
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

            ],
          ),
        ),
        MySeparator(color: AppColors.grayLight,)
      ],
    );});
  }
  /// collect price
  num totalOneProduct = 0;
  collectTotalPrice(CartItems cartItems){
    num price = 0;
    num extrasPrice = 0;
    // for (int i = 0; i < cartItems.additionsCart.length; i++) {
    //     extrasPrice = (extrasPrice) + ((cartItems.additionsCart[i].additionsPrice)* (cartItems.quantity));
    // }
    price = (cartItems.price * cartItems.quantity)+(extrasPrice);
    totalOneProduct = price;
  }
}
