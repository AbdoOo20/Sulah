import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/core/helper/no_data.dart';
import 'package:sulah/data/model/response/storesModel.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../../core/resources/resources.dart';
import '../../../../../../../../component/component.dart';
import '../../../../../../../../component/svg_icon.dart';
import '../../productsViewModel.dart';
import '../../widget/rate_par.dart';

class Ratings extends StatefulWidget {
  const Ratings({Key? key, required this.storeId}) : super(key: key);
  final String storeId;

  @override
  State<Ratings> createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> {
  void initState() {
    super.initState();
    _loadData(context);
  }

  Future<void> _loadData(
    BuildContext context,
  ) async {
    Provider.of<ProductsViewModel>(context, listen: false).getStoreRate(context, widget.storeId);
  }

  @override
  Widget build(BuildContext context) {
    return             Consumer<ProductsViewModel>(
        builder: (context, data, child) =>   RefreshIndicator(
            onRefresh: () async => await _loadData(context),
            child: ScreenStateLayout(
                isLoading: data.storeRateModel == null,
                builder: (context) =>Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 20.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(36.h)),
          color: AppColors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 16..w,
                bottom: 12.h,
                right: 16.w,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${LocaleKeys.ratings.tr()}${(data.storeRateModel?.data?.isEmpty ?? true)?'':'( ${data.storeRateModel?.data?.length} )'}',
                    style: TextStyles()
                        .getTitleStyle(
                          fontSize: 14.sp,
                        )
                        .customColor(AppColors.black),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: CircleAvatar(
                        backgroundColor: AppColors.black,
                        child: Center(
                            child: Icon(
                          Icons.clear,
                          size: 18.r,
                          color: AppColors.white,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ScreenStateLayout(
                      isEmpty: data.storeRateModel?.data?.isEmpty ?? true,
                      builder: (context) => Expanded(
                        child: ListAnimatorData(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.h, horizontal: 16.w),
                            shrinkWrap: true,
                            itemCount: data.storeRateModel?.data?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: EdgeInsets.all(12.r),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.lightGray),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 72.h,
                                          width: 72.w,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: AppColors.white),
                                              borderRadius: BorderRadius.circular(12.r),
                                              color: AppColors.grayLight),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.fill,
                                            imageUrl: data.storeRateModel?.data?[index].fromUser?.logo ?? '',
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child: SizedBox(
                                                        width: 20,
                                                        height: 20,
                                                        child:
                                                            CircularProgressIndicator(
                                                          strokeWidth: 1,
                                                        ))),
                                            errorWidget:
                                                (context, url, error) =>
                                                    SVGIcon(
                                              Assets.logo,
                                              height: 48.h,
                                              width: 48.w,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              data.storeRateModel?.data?[index].fromUser?.name ?? '',
                                              style: TextStyles()
                                                  .getTitleStyle(
                                                      fontSize: 14.sp)
                                                  .customColor(AppColors.black),
                                            ),
                                            Text(
                                              data.storeRateModel?.data?[index].createdAt ?? '',
                                              style: TextStyles()
                                                  .getRegularStyle(
                                                      fontSize: 12.sp)
                                                  .customColor(AppColors.gray),
                                            ),
                                            RateWidget(
                                                itemSize: 20,
                                                iconSize: 16.r,
                                                ignoreGestures: true,
                                                initialRating: data.storeRateModel?.data?[index].rate)
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 16.h),
                                    Text(
                                      data.storeRateModel?.data?[index].comment ?? '',
                                      style: TextStyles()
                                          .getRegularStyle(fontSize: 14.sp)
                                          .customColor(AppColors.black),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    )
          ],
        )))));
  }
}
