import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/resources/app_assets.dart';
import 'package:khedmaty/core/resources/locale_keys.g.dart';
import 'package:khedmaty/core/routing/route.dart';
import 'package:khedmaty/presentation/component/component.dart';
import 'package:khedmaty/presentation/component/svg_icon.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/res/text_styles.dart';
import '../../../../../../../core/resources/app_colors.dart';
import '../../../../../../../data/datasource/locale/database_provider.dart';
import '../payment&DeliveryScreen/payment&Delivery.dart';
import 'widget/cardItem.dart';

class ShoppingCard extends StatefulWidget {
  const ShoppingCard({Key? key}) : super(key: key);

  @override
  State<ShoppingCard> createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  @override
  void initState() {
    super.initState();
    Provider.of<CartProvider>(context, listen: false).getCart();
  }
  String preparationTimeType = "";
  int preparationTimeAsMinutes = 0;
  int preparationTime = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.theCart.tr(),
          color: Colors.transparent,
        ),
        body: Consumer<CartProvider>(builder: (context, cart, child) {
          return cart.cartItems.isNotEmpty?
            Column(children: [
            Expanded(
              child: ListAnimatorData(
                      shrinkWrap: true,
                      itemCount: cart.cartItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 16.w,
                            right: 16.w,
                          ),
                          child: CardItem(
                            cartItems: cart.cartItems[index],
                          ),
                        );
                      },
                    )
            ),
            Container(
              height: 69.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 1), //(x,y)
                    blurRadius: 10,
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                  top: 8.h, bottom: 8.h, left: 16.w, right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        LocaleKeys.theTotal.tr(),
                        style: TextStyles()
                            .getRegularStyle(
                              fontSize: 18.sp,
                            )
                            .customColor(AppColors.black),
                      ),
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '${double.parse(cart.total.toString()).toPrecision(1)}',
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
                      )
                    ],
                  ),
                  CustomButton(
                    onTap: () {
                      if (cart.cartItems.isEmpty) {
                        return;
                      } else {
                        push(PaymentDelivery(totalProductsPrice: cart.total,));
                      }
                    },
                    color: AppColors.primaryColor,
                    width: 101.w,
                    height: 45.h,
                    title: LocaleKeys.orderNow.tr(),
                  )
                ],
              ),
            ),
          ])
              : SVGIcon(Assets.errorCart, height: 200.h, width: 200.w);
        }));
  }
}
