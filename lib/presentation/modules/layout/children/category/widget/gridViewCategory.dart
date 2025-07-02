import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/routing/route.dart';
import '../../home/children/products/products.dart';
import '../../home/homeViewModel.dart';
import 'custom_card_Category.dart';

class GridViewCategories extends StatelessWidget {
  const GridViewCategories({Key? key, required this.whichType}) : super(key: key);
  final String whichType;

  @override


  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context,  departmentsItem, child) {
      return
      ConstrainedBox(constraints: BoxConstraints(maxHeight:MediaQuery.of(context).size.height, minHeight: 56.0.h),
      child: GridView.builder(
        physics:whichType =='home'?const NeverScrollableScrollPhysics():const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          shrinkWrap: true,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: .76,
            crossAxisSpacing: 3.h,
            mainAxisSpacing: 3.h,
          ),
          itemCount: departmentsItem.departmentsModel?.data?.length ,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                push(const Productions(isFrom: 'department',));
                },
              child: CustomCaredCategory(
                url: departmentsItem.departmentsModel?.data?[index].image ?? '',
                title: departmentsItem.departmentsModel?.data?[index].title ?? '',
              ),
            );
          }),
    );});
  }
}
