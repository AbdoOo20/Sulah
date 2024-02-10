import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';


import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/routing/route.dart';
import '../../../../../component/svg_icon.dart';
import '../homeViewModel.dart';
import 'all_stores.dart';
import 'nearYou.dart';


class CustomNearToYouList extends StatelessWidget {
  const CustomNearToYouList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, data, child) {
      return data.nearestStoresModel == null
          ? const SizedBox()
          : Container(
        color: AppColors.listColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: 32.h,
                  bottom: 12.h,
                  right: 16.w,
                  left: 16.w),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SVGIcon(
                        Assets.nearYou2,
                        width: 20.w,
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        LocaleKeys.nearYou.tr(),
                        style: TextStyles()
                            .getTitleStyle(fontSize: 18.sp)
                            .customColor(AppColors.black),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      push( AllStores());
                    },
                    child: Row(
                      children: [
                        Text(
                          LocaleKeys.viewAll.tr(),
                          style: TextStyles()
                              .getRegularStyle(
                            fontSize: 14.sp,
                          )
                              .customColor(
                              AppColors.primaryColor),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.primaryColor,
                          size: 12.r,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const ListOfNearYou(),
            SizedBox(
              height: 32.h,
            )
          ],
        ),
      );
    });
  }
}
