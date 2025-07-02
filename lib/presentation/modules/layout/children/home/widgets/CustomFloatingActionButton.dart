import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';


import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/app_assets.dart';
import '../../../../../../core/resources/app_colors.dart';
import '../../../../../../core/routing/route.dart';
import '../../../../../../data/datasource/locale/database_provider.dart';
import '../../../../../component/svg_icon.dart';
import '../children/shoppingCard/shoppingCard.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.r),
      child: FloatingActionButton(
        onPressed: () {
          push(const ShoppingCard());
        },
        elevation: 5,
        backgroundColor: AppColors.primaryColor,
        splashColor: Colors.grey,
        child: Stack(children: <Widget>[
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: AppColors.primaryColor,
            ),
            child: SVGIcon(
              Assets.iconShoppingCard,
              height: 24.h,
              width: 24.w,
              color: AppColors.white,
            ),
          ),
         context.watch<CartProvider>().countProductInCart==0?const SizedBox(): Positioned(
            top: 5,
            right: 5,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                border: Border.all(width: .8.w, color: AppColors.grayLight),
                color: AppColors.black,
              ),
              child: Center(
                child: Text(
                  '${context.watch<CartProvider>().countProductInCart}',
                  style: TextStyles()
                      .getTitleStyle(fontSize: 9.sp)
                      .customColor(AppColors.white),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
