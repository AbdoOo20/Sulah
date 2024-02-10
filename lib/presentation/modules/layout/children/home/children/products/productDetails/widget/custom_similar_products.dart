import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../../core/resources/resources.dart';
import '../../../../../../../../component/svg_icon.dart';

import '../../widget/gridView_Products.dart';
import '../../productsViewModel.dart';



class CustomSimilarProducts extends StatelessWidget {
  const CustomSimilarProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsViewModel>(
        builder: (context, data, child) {
          print(data.similarProductsModel?.data?.length);
          return data.similarProductsModel?.data?.isEmpty??true ?
          const SizedBox()
              :  Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.all(16.r),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [SVGIcon(Assets.similarProducts,width: 20.w,height: 20.h,),Text(LocaleKeys.similarProducts.tr(),style: TextStyles().getTitleStyle(fontSize: 18.sp),)],),
              ),
              GridViewProducts(model: data.similarProductsModel),
              // ),
            ],
          );
        });
  }
}
