import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/locale_keys.g.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../component/component.dart';
import '../../../../../component/custom_scaffold.dart';

import '../settingViewModel.dart';
import 'widget/fav_products.dart';
import 'widget/fav_stores.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    super.initState();
    _getMyFavorite(context,0);
  }
  _getMyFavorite(BuildContext context,int  position) async {
    Provider.of<SettingViewModel>(context, listen: false).getMyFavoriteItem(context,position);
  }
  int isClicked = 0;
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
          titleWidget: Text(
        LocaleKeys.favorite.tr(),
        style: TextStyles()
            .getTitleStyle(fontSize: 18.sp)
            .customColor(AppColors.black),
      )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () async {
                    setState(() {
                      isClicked = 0;
                    });
                    _getMyFavorite(context,isClicked);

                    controller.animateToPage(isClicked,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  },
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys.theStore.tr(),
                        style: TextStyles()
                            .getTitleStyle(fontSize: 18.sp)
                            .customColor(
                          isClicked == 0
                              ? AppColors.primaryColor
                              : AppColors.gray,
                        ),
                      ),
                      isClicked == 0
                          ? Container(
                        height: 2.h,
                        width: 40.w,
                        color: AppColors.primaryColor,
                      )
                          : SizedBox()
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    setState(() {
                      isClicked = 1;
                      _getMyFavorite(context,isClicked);
                    });
                    controller.animateToPage(isClicked,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  },
                  child: Column(
                    children: [
                      Text(
                        LocaleKeys.products.tr(),
                        style: TextStyles()
                            .getTitleStyle(fontSize: 18.sp)
                            .customColor(
                          isClicked == 1
                              ? AppColors.primaryColor
                              : AppColors.gray,
                        ),
                      ),
                      isClicked == 1
                          ? Container(
                        height: 2.h,
                        width: 55.w,
                        color: AppColors.primaryColor,
                      )
                          : SizedBox()
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              // flex: 2,
              child: PageView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  FavStores(),
                  FavProducts()
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
  //


}
