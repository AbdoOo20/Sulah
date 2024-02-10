import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/resources/app_assets.dart';
import 'package:khedmaty/presentation/component/svg_icon.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../../data/datasource/locale/database_model.dart';
import '../../../../../../../../data/datasource/locale/database_provider.dart';
import '../../../../../../../component/seperator.dart';


class ListProducts extends StatelessWidget {
   ListProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cart, child) {
     return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), color: AppColors.main30),
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: double.infinity.h, minHeight: 56.0.h),
        child: cart.cartItems.isNotEmpty
            ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: cart.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  /// collect price
                  num totalOneProduct = 0;
                  collectTotalPrice(CartItems cartItems){
                    num price = 0;
                    num extrasPrice = 0;
                    // for (int i = 0; i < cartItems.additionsCart.length; i++) {
                    //   extrasPrice = (extrasPrice) + (cartItems.additionsCart[i].additionsPrice);
                    // }
                    price = (cartItems.price * cartItems.quantity)+(extrasPrice);
                    totalOneProduct = price;
                  }
                  collectTotalPrice( cart.cartItems[index]);
                  return Container(
                    margin: EdgeInsets.only(
                        top: 8.h, bottom: 8.h, left: 12.w, right: 12.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 48.h,
                              width: 72.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.r),
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) =>
                                  new Center(child: SizedBox(width:20.w,height:20.h,child: CircularProgressIndicator(strokeWidth: 1,))),
                                  imageUrl: cart.cartItems[index].image ?? '',
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
                              width: 8.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width *0.6,
                                  child: Text(
                                    cart.cartItems[index].name ?? '',
                                    style: TextStyles().getTitleStyle(
                                      fontSize: 12.sp,
                                    ).customColor(AppColors.black),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*.63,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'x',
                                            style: TextStyles().getRegularStyle(fontSize: 12.sp,).customColor(AppColors.primaryColor),
                                          ),
                                          Text(
                                            '${cart.cartItems[index].quantity}',
                                            style: TextStyles().getTitleStyle(fontSize: 18.sp,).customColor(AppColors.primaryColor),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Text(
                                            softWrap: false,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            LocaleKeys.theTotal.tr(),
                                            style: TextStyles().getRegularStyle(fontSize: 14.sp,).customColor(AppColors.black),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '${double.parse(totalOneProduct.toString()).toPrecision(1)}',
                                                style: TextStyles().getTitleStyle(
                                                  fontSize: 16.sp,
                                                ).customColor(AppColors.primaryColor),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                LocaleKeys.sar.tr(),
                                                style: TextStyles().getTitleStyle(
                                                  fontSize: 12.sp,
                                                ).customColor(AppColors.primaryColor),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          )


                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        const MySeparator(
                          color: AppColors.inactiveColor,
                        ),
                      ],
                    ),
                  );
                })
            : SVGIcon(
                Assets.errorCart,
                height: 50.h,
                width: 50.w,
              ),
      ),
    );});
  }
}
