import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/presentation/modules/layout/children/offers/offer%20view%20model.dart';
import 'package:khedmaty/presentation/modules/layout/children/offers/widgets/offer%20item.dart';
import 'package:provider/provider.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../../core/resources/app_colors.dart';
import '../../../../../core/resources/locale_keys.g.dart';
import '../../../../component/appbars/custom_app_bar.dart';
import '../../../../component/buttons/custom_button.dart';
import '../../../../component/custom_scaffold.dart';
import '../../../../component/screen_state_layout.dart';
import '../../../../component/spaces.dart';

class MyOffers extends StatefulWidget {
  const MyOffers({Key? key}) : super(key: key);

  @override
  State<MyOffers> createState() => _MyOffersState();
}

class _MyOffersState extends State<MyOffers> {
  late OfferProvider offerProvider;

  @override
  void initState() {
    Provider.of<OfferProvider>(context, listen: false).getMyOrders(context);
    super.initState();
  }

  int isClicked = 0;
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    offerProvider = Provider.of(context);
    return CustomScaffold(
      appBar: CustomAppBar(
        titleWidget: Text(
          LocaleKeys.offers.tr(),
          style: TextStyles()
              .getTitleStyle(fontSize: 18.sp)
              .customColor(AppColors.black),
        ),
        isBackButtonExist: false,
      ),
      body: Consumer<OfferProvider>(
        builder: (context, data, child) {
          return RefreshIndicator(
            onRefresh: () async => await offerProvider.getMyOrders(context),
            child: Column(
              children: [
                VerticalSpace(24.h),
                Padding(
                  padding: EdgeInsets.only(right: 16.w, left: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomButton(
                          onTap: () async {
                            setState(() {
                              isClicked = 0;
                            });
                            controller.animateToPage(isClicked,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          },
                          title: LocaleKeys.orders.tr(),
                          // width: 108.67.w,
                          textColor: isClicked == 0
                              ? AppColors.white
                              : AppColors.black,
                          color: isClicked == 0
                              ? AppColors.primaryColor
                              : AppColors.grayLight,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Expanded(
                        child: CustomButton(
                          onTap: () async {
                            setState(() {
                              isClicked = 1;
                            });
                            controller.animateToPage(isClicked,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);
                          },
                          title: LocaleKeys.theOffer.tr(),
                          // width: 108.67.w,
                          textColor: isClicked == 1
                              ? AppColors.white
                              : AppColors.black,
                          color: isClicked == 1
                              ? AppColors.primaryColor
                              : AppColors.grayLight,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  // flex: 2,
                  child: PageView(
                    controller: controller,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 16.w, left: 16.w),
                        child: ScreenStateLayout(
                          isLoading: data.isLoading,
                          isEmpty: data.products.isEmpty,
                          builder: (context) => ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: data.products.length,
                            itemBuilder: (context, index) {
                              return RefreshIndicator(
                                onRefresh: () async =>
                                    await data.getMyOrders(context),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 24.h),
                                  child: OfferItem(data.products[index], false),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 16.w, left: 16.w),
                        child: ScreenStateLayout(
                          isLoading: data.isLoading,
                          isEmpty: data.offers.isEmpty,
                          builder: (context) => ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: data.offers.length,
                            itemBuilder: (context, index) {
                              return RefreshIndicator(
                                onRefresh: () async =>
                                    await data.getMyOrders(context),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 24.h),
                                  child: OfferItem(data.offers[index], true),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
