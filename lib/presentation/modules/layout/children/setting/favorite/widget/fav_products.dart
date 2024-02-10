import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../../component/screen_state_layout.dart';

import '../../../home/children/products/widget/custom_card_products.dart';
import '../../settingViewModel.dart';

class FavProducts extends StatelessWidget {
  const FavProducts({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer<SettingViewModel>(
        builder: (context, items, child) => RefreshIndicator(
        onRefresh: () async => await items.getMyFavoriteItem(context, 1),
    child: ScreenStateLayout(
    isLoading: context.watch<SettingViewModel>().myFavoriteProductModel == null ,
    isEmpty: items.myFavoriteProductModel?.data?.isEmpty??true,
    builder: (context) =>GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .82,
          crossAxisSpacing: 8.h,
          mainAxisSpacing: 8.h,
        ),
        itemCount: items.myFavoriteProductModel?.data?.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CustomCaredProducts(model: items.myFavoriteProductModel?.data?[index], productIndex: index,whichScreen: "fav",);
        }))));
  }
}
