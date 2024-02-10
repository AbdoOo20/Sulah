import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/data/model/response/one_product_model.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../../core/resources/resources.dart';
import '../../../../../../../../../core/utils/showToast.dart';
import '../../../../../../../../../data/repository/SaveUserData.dart';
import '../../../../../../../../../injection.dart';
import '../../../../../../../../component/svg_icon.dart';
import '../../../../../setting/settingViewModel.dart';
import '../../widget/rate_par.dart';
import '../raitingModelSheet/raitingModelSheet.dart';

class StoreCard extends StatefulWidget {
  const StoreCard({
    Key? key,
    this.oneProductStore,
  }) : super(key: key);
  final User? oneProductStore;


  @override
  State<StoreCard> createState() => _StoreCardState();
}

class _StoreCardState extends State<StoreCard> {
  SaveUserData getUserId = getIt();
  bool clickFav = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.grey, //New
              blurRadius: 4.0,
              offset: Offset(0, 0))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Container(
          //   height: 64.h,
          //   width: 63.w,
          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
          //   child: CachedNetworkImage(
          //     fit: BoxFit.fill,
          //     imageUrl: widget.oneProductStore?.logo ?? '',
          //     placeholder: (context, url) => Center(
          //         child: SizedBox(
          //             width: 20.w,
          //             height: 20.h,
          //             child: const CircularProgressIndicator(
          //               strokeWidth: 1
          //             ))),
          //     errorWidget: (context, url, error) => SVGIcon(
          //       Assets.logo,
          //       height: 63.h,
          //       width: 62.w,
          //     ),
          //   ),
          // ),
          SizedBox(),
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(),
                    // Text(
                    //   widget.oneProductStore?.name ?? '',
                    //   style: TextStyles()
                    //       .getTitleStyle(fontSize: 14.sp)
                    //       .customColor(AppColors.black),
                    // ),
                    InkWell(
                        onTap: () {
                          if (getUserId.getUserData()?.data?.id != null){
          widget.oneProductStore?.isSaved == 0
          ? ToastUtils.showToast(
          'addedToSuccessfully'.tr())
              : ToastUtils.showToast(
          'removedFromWishlist'.tr());
          Provider.of<SettingViewModel>(context,
          listen: false)
              .addStoreFavorite(
          context, widget.oneProductStore?.id.toString()??'');
          setState(() {
          widget.oneProductStore?.isSaved ==
          0
          ? widget.oneProductStore
              ?.isSaved = 1
              : widget.oneProductStore
              ?.isSaved = 0;
          });

          }else{
          ToastUtils.showToast('LoginRequired'.tr());
          }
                              },

                        child: SVGIcon(
                          widget.oneProductStore?.isSaved == 0
                              ? Assets.saveIcon
                              : Assets.activeSaveIcon,
                          height: 24.h,
                          width: 24.w,
                        ),
                    )
                  ],
                ),
                Row(
                  children: [
                    // Text(
                    //   widget.oneProductStore?.name.toString() ??
                    //       '',
                    //   style: TextStyles()
                    //       .getRegularStyle(fontSize: 12.sp)
                    //       .customColor(Colors.red),
                    // ),
                    (widget.oneProductStore?.status == 1)
                        ? const SizedBox() :
                    Container(
                            height: 25.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Center(
                              child: Text(
                                "storeNotAvailable".tr(),
                                style: TextStyles()
                                    .getRegularStyle(
                                      fontSize: 11.sp,
                                    )
                                    .customColor(AppColors.white),
                              ),
                            ),
                          )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RateWidget(
                        itemSize: 20.r,
                        iconSize: 16.r,
                        initialRating: widget.oneProductStore?.rate,
                        ignoreGestures: true),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0.r),
                              ),
                            ),
                            builder: (BuildContext context) {
                              return Ratings(
                                storeId: widget.oneProductStore?.id.toString()??'',
                              );
                            });
                      },
                      child: Text(
                        '${LocaleKeys.ratings.tr()}${widget.oneProductStore?.rateCount!=0?'( ${widget.oneProductStore?.rateCount} )':''}',
                        style: TextStyles()
                            .getRegularStyle(fontSize: 12.sp)
                            .customColor(AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
