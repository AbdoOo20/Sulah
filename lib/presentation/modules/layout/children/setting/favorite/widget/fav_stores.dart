import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/res/text_styles.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/utils/showToast.dart';
import '../../../../../../component/screen_state_layout.dart';
import '../../../../../../component/svg_icon.dart';

import '../../../home/children/products/productsViewModel.dart';
import '../../settingViewModel.dart';

class FavStores extends StatefulWidget {
  const FavStores({Key? key}) : super(key: key);

  @override
  State<FavStores> createState() => _FavStoresState();
}

class _FavStoresState extends State<FavStores> {
  @override
  Widget build(BuildContext context) {
   bool isLoading= Provider.of<ProductsViewModel>(context, listen: true).isLoading;
    return Consumer<SettingViewModel>(
        builder: (context, items, child) => RefreshIndicator(
        onRefresh: () async => await items.getMyFavoriteItem(context, 0),
    child: ScreenStateLayout(
    isLoading: context.watch<SettingViewModel>().myFavoriteStoreModel == null ,
    isEmpty: items.myFavoriteStoreModel?.data?.isEmpty??true,
    builder: (context) =>ListView.builder(
        shrinkWrap: true,
        itemCount: items.myFavoriteStoreModel?.data?.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Row(
                      children: [
                        Container(
                          height: 80.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r)),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: items.myFavoriteStoreModel?.data?[index].logo??'',
                            placeholder: (context, url) =>
                                const Center(child: SizedBox(width:20,height:20,child: CircularProgressIndicator(strokeWidth: 1,))),
                            errorWidget: (context, url, error) =>
                                SVGIcon(
                                  Assets.logo,
                                  height: 100.h,
                                  width: 100.w,
                                ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              items.myFavoriteStoreModel?.data?[index].name??'',
                              style: TextStyles()
                                  .getTitleStyle(fontSize: 14.sp)
                                  .customColor(AppColors.black),
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                SVGIcon(
                                  Assets.locationIcon1,
                                  height: 16.h,
                                  width: 16.w,
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width/2,
                                  child: Text(
                                    items.myFavoriteStoreModel?.data?[index].address??'',
                                    style: TextStyles()
                                        .getRegularStyle(
                                        fontSize: 12.sp)
                                        .customColor(AppColors.black),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),

                      ],
                    ),
                  ),
                  Positioned( top: 10.h,left: 0.w,
                    child: InkWell(onTap:(){
                     if(!isLoading){
                       items.myFavoriteStoreModel?.data?[index].isSaved==0?ToastUtils.showToast('addedToSuccessfully'.tr()):ToastUtils.showToast('removedFromWishlist'.tr());
                       items.addStoreFavorite(context,items.myFavoriteStoreModel?.data?[index].id.toString()??'');
                       setState(() {
                         items.myFavoriteStoreModel?.data?[index].isSaved == 0 ?
                         (items.myFavoriteStoreModel?.data?[index].isSaved  = 1 ):
                         items.myFavoriteStoreModel?.data?[index].isSaved  = 0;
                       });
                     }
                    },
                      child:items.myFavoriteStoreModel?.data?[index].isSaved==1? SVGIcon(
                        Assets.activeSaveIcon,
                        height: 24.h,
                        width: 24.w,
                      ):SVGIcon(
                        Assets.saveIcon,
                        height: 24.h,
                        width: 24.w,
                      ),
                    ),
                  )
                ],
              ),
              SVGIcon(Assets.line0,height: 1,width: MediaQuery.of(context).size.width,)
            ],
          );
        }))));
  }
}
