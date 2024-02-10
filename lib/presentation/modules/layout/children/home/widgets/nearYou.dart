import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/presentation/component/component.dart';
import 'package:provider/provider.dart';


import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/routing/route.dart';
import '../children/products/products.dart';
import '../homeViewModel.dart';

class ListOfNearYou extends StatelessWidget {
  const ListOfNearYou({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, nearYouData, child) {
      return SizedBox(height: 114.h,
      child:ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount:nearYouData.nearestStoresModel?.data?.length,
          itemBuilder: (context, index) {
            return
            InkWell(
              onTap: (){nearYouData.saveUserData.saveStoreId(nearYouData.nearestStoresModel?.data?[index]?.id.toString()??'');
              push(Productions(oneStore:nearYouData.nearestStoresModel?.data?[index],isFrom: 'home',));},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                 height: 113.h,
                width: 96.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color:AppColors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: 8.h,
                      left: 8.w,
                      bottom: 8.h,
                      right: 8.w),
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 72.h,
                        width: 72.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: CommonNetworkImage(
                            imageUrl: nearYouData.nearestStoresModel?.data?[index]?.logo.toString()??'',

                          ),
                        ),
                      ),
                      Text(
                        nearYouData.nearestStoresModel?.data?[index]?.name.toString()??'',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles().getRegularStyle(fontSize: 14.sp).customColor(AppColors.black),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );});
  }
}
