import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';


import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../component/svg_icon.dart';
import '../homeViewModel.dart';
import 'prominentStores.dart';

class CustomProminent extends StatelessWidget {
  const CustomProminent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
        builder: (context, bestStoresData, child) {
          return bestStoresData.bestStoresModel?.data?.isEmpty??true?SizedBox():Container(
            color: const Color(0xffFFF7F5),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 32.h,
                      bottom: 12.h,
                      right: 16.w,
                      left: 16.w),
                  child: Row(
                    children: [
                      SVGIcon(
                        Assets.pronmentStores,
                        width: 20.w,
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        LocaleKeys.prominentStores.tr(),
                        style: TextStyles()
                            .getTitleStyle(fontSize: 18.sp)
                            .customColor(AppColors.black),
                      ),
                    ],
                  ),
                ),
                ListOfProminentStores(
                  bestStoresModel: bestStoresData.bestStoresModel,
                ),
                SizedBox(
                  height: 32.h,
                )
              ],
            ),
          );
        });
  }
}
