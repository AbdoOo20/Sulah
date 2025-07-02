import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';


import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../component/svg_icon.dart';
import '../children/products/widget/gridView_Products.dart';
import '../homeViewModel.dart';

class CustomBestSell extends StatelessWidget {
  const CustomBestSell({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
        builder: (context, data, child) {
          return data.bestSellerModel?.data?.isEmpty??true ?
          const SizedBox()
              :  Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.all(16.r),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [SVGIcon(Assets.bestSeller,width: 20.w,height: 20.h,),Text(LocaleKeys.bestSeller.tr(),style: TextStyles().getTitleStyle(fontSize: 18.sp),)],),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:16.w ),
                // child: ConstrainedBox(
                //     constraints: const BoxConstraints(maxHeight:double.infinity),
                    child:  GridViewProducts(model: data.bestSellerModel,)
                ),
             // ),
            ],
          );
        });
  }
}
