import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/routing/route.dart';
import '../../../../../component/svg_icon.dart';
import '../../category/category.dart';
import '../../category/widget/gridViewCategory.dart';
import '../homeViewModel.dart';
class CustomCategoryList extends StatelessWidget {
  const CustomCategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, departmentsItem, child) {
          return departmentsItem.departmentsModel?.data?.isEmpty??true
              ? const SizedBox()
              : SizedBox(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 12.h, top: 12.h, right: 16.w, left: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SVGIcon(
                              Assets.categories,
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              LocaleKeys.sections.tr(),
                              style: TextStyles()
                                  .getTitleStyle(fontSize: 18.sp)
                                  .customColor(AppColors.black),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            push(const Category(
                              whichType: 'departments',
                            ));
                          },
                          child: Row(
                            children: [
                              Text(
                                LocaleKeys.viewAll.tr(),
                                style: TextStyles()
                                    .getRegularStyle(
                                  fontSize: 14.sp,
                                )
                                    .customColor(AppColors.primaryColor),
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
                  Container(
                    constraints: BoxConstraints(maxHeight: 290.h), // Set maximum height
                    child: const GridViewCategories(
                      whichType: 'home',
                    ),
                  ),
                ],
              ));
        });
  }
}
