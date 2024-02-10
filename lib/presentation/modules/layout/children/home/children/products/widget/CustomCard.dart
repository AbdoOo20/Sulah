import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/resources/locale_keys.g.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/helper/socialMediaHelper.dart';
import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../../core/utils/showToast.dart';
import '../../../../../../../../data/model/response/one_store_model.dart';
import '../../../../../../../../data/repository/SaveUserData.dart';
import '../../../../../../../../injection.dart';
import '../../../../../../../component/svg_icon.dart';
import '../../../../setting/settingViewModel.dart';
import '../productDetails/raitingModelSheet/raitingModelSheet.dart';
import '../productDetails/raitingModelSheet/widget/raitingBar.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key, this.oneStore})
      : super(key: key);
  final OneStore? oneStore;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool clickFav = false;
  SaveUserData getUserId = getIt();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235.h,
      width: 343.w,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColors.main20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               SizedBox( height: 24.h,
                width: 24.w,),
              Container(
                height: 100.h,
                width: 100.w,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: widget.oneStore?.logo ?? '',
                  placeholder: (context, url) => const Center(
                      child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                          ))),
                  errorWidget: (context, url, error) => SVGIcon(
                    Assets.logo,
                    height: 100.h,
                    width: 100.w,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (getUserId.getUserData()?.data?.id != null){
                    widget.oneStore?.isSaved == 0
                        ? ToastUtils.showToast(
                        'addedToSuccessfully'.tr())
                        : ToastUtils.showToast(
                        'removedFromWishlist'.tr());
                    Provider.of<SettingViewModel>(context,
                        listen: false)
                        .addStoreFavorite(
                        context, widget.oneStore?.id.toString()??'');
                    setState(() {
                      widget.oneStore?.isSaved ==
                          0
                          ? widget.oneStore
                          ?.isSaved = 1
                          : widget.oneStore
                          ?.isSaved = 0;
                    });

                  }else{
                    ToastUtils.showToast('LoginRequired'.tr());
                  }
                },

                child: SVGIcon(
                  widget.oneStore?.isSaved == 0
                      ? Assets.saveIcon
                      : Assets.activeSaveIcon,
                  height: 24.h,
                  width: 24.w,
                ),
              )
            ],
          ),
          SizedBox(height: 8.w),
          Text(
            widget.oneStore?.name ??'',
            style: TextStyles()
                .getTitleStyle(fontSize: 18.sp)
                .customColor(AppColors.black),
          ),
          SizedBox(height: 2.h),
          InkWell(
            onTap: () {
              SocialMediaHelper().openGoogleMap(
                  double.tryParse((widget.oneStore?.latitude ?? '')
                      .toString()) ??
                      -1,
                  double.tryParse((widget.oneStore?.longitude ?? '')
                      .toString()) ??
                      -1);
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width *.4,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SVGIcon(
                      Assets.locationIcon1,
                      height: 16.h,
                      width: 16.w,
                      color: AppColors.primaryColor,
                    ),
                    Expanded(
                      child: Text(
                        widget.oneStore?.address ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles()
                            .getRegularStyle(fontSize: 14.sp)
                            .customColor(AppColors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(

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
                          storeId: widget.oneStore?.id.toString()??'',
                        );
                      });
                },
                child: Text(
                  '${LocaleKeys.ratings.tr()}${widget.oneStore?.rateCount==0?'':'( ${widget.oneStore?.rateCount} )'}',
                  style: TextStyles()
                      .getRegularStyle(fontSize: 12.sp)
                      .customColor(AppColors.primaryColor),
                ),
              ),
              SizedBox(width:2.w),
              RateWidget(
                  itemSize: 20,
                  iconSize: 16.r,
                  initialRating: widget.oneStore?.rate,
                  ignoreGestures: true),
            ],
          ),

        ],
      ),
    );
  }
}
