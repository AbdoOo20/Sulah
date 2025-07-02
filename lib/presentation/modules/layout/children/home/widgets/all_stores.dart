import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/presentation/component/component.dart';
import 'package:provider/provider.dart';


import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/routing/route.dart';
import '../../../../../component/svg_icon.dart';
import '../children/products/products.dart';
import '../homeViewModel.dart';

class AllStores extends StatefulWidget {
  const AllStores({Key? key}) : super(key: key);
  @override
  State<AllStores> createState() => _AllStoresState();
}

class _AllStoresState extends State<AllStores> {
  @override
  void initState() {
    super.initState();
    _loadData(context, "");
  }

  Future<void> _loadData(BuildContext context, String searchName) async {
    await Provider.of<HomeViewModel>(context, listen: false)
        .getBestStores(context, title: searchName);
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.allStores.tr(),
      ),
      body: Consumer<HomeViewModel>(
          builder: (context, data, child) => Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.r),
                    child: CustomTextFieldNormal(
                      hint: LocaleKeys.findaProduct.tr(),
                      iconSVG: Assets.searchIcon,
                      background: AppColors.grayLight,
                      controller: searchController,
                      onChange: (text) {
                        _loadData(context, text);
                      },
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Expanded(
                    child: RefreshIndicator(
                        onRefresh: () async => await _loadData(context, searchController.text),
                        child: ScreenStateLayout(
                            isLoading: data.bestStoresModel == null,
                            isEmpty: data.bestStoresModel?.data?.isEmpty ?? true,
                            builder: (context) => GridView.builder(
                                // padding: EdgeInsets.symmetric(horizontal: 16.w),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.40,
                                  crossAxisSpacing: 3.h,
                                  mainAxisSpacing: 3.w,
                                ),
                                itemCount: data.bestStoresModel?.data?.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      push(Productions(
                                        isFrom: 'home',
                                        oneStore: data.bestStoresModel?.data?[index],
                                      ));
                                    },
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 4.w,vertical: 4.h),
                                      height: 125.h,
                                      width: 167.5.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12.r),
                                        color: AppColors.inputBG,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 8.h,
                                            left: 12.w,
                                            bottom: 8.h,
                                            right: 12.w),
                                        child: Column(
                                          //  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              height: 72.h,
                                              width: 143.5.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.fill,
                                                  imageUrl: data.bestStoresModel?.data?[index].logo ?? '',
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
                                                  // Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 8.h),
                                            Text(
                                              data.bestStoresModel?.data?[index].name ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyles()
                                                  .getRegularStyle(
                                                      fontSize: 14.sp)
                                                  .customColor(AppColors.black),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }))),
                  )
                ],
              )),
    );
  }
}
