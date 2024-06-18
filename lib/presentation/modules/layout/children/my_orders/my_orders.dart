import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/presentation/component/spaces.dart';
import 'package:provider/provider.dart';

import '../../../../../core/res/text_styles.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../component/component.dart';
import 'my_orders_view_model.dart';
import 'widget/custom_list_view.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  void initState() {
    _getMyOrders(context, 'current');
    super.initState();
  }

  int isClicked = 0;
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: CustomAppBar(
          titleWidget: Text(
            LocaleKeys.orders.tr(),
            style: TextStyles()
                .getTitleStyle(fontSize: 18.sp)
                .customColor(AppColors.black),
          ),
          isBackButtonExist: false,
        ),
        body: Consumer<MyOrdersViewModel>(builder: (context, data, child) {
          return RefreshIndicator(
              onRefresh: () async => await _getMyOrders(
                  context, isClicked == 0 ? 'current' : 'previous'),
              child: Column(children: [
                VerticalSpace(24.h),
                Padding(
                  padding: EdgeInsets.only(right: 16.w, left: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 166.w,
                        child: CustomButton(
                          onTap: () async {
                            setState(() {
                              isClicked = 0;
                            });
                            controller.animateToPage(isClicked,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);
                            _getMyOrders(context, 'current');
                          },
                          textColor: isClicked == 0
                              ? AppColors.white
                              : AppColors.black,
                          color: isClicked == 0
                              ? AppColors.primaryColor
                              : AppColors.grayLight,
                          title: LocaleKeys.current.tr(),
                        ),
                      ),
                      SizedBox(
                        width: 166.w,
                        child: CustomButton(
                          onTap: () async {
                            setState(() {
                              isClicked = 2;
                            });
                            controller.animateToPage(isClicked,
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut);
                            _getMyOrders(context, 'previous');
                          },
                          title: LocaleKeys.previous.tr(),
                          // width: 108.67.w,
                          textColor: isClicked == 2
                              ? AppColors.white
                              : AppColors.black,
                          color: isClicked == 2
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
                            isLoading: data.myOrdersModel == null,
                            isEmpty: data.myOrdersModel?.data?.isEmpty ?? true,
                            builder: (context) => CustomListView(
                              myOrdersModel: data.myOrdersModel,
                              type: 'current',
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(right: 16.w, left: 16.w),
                        child: ScreenStateLayout(
                          isLoading: data.myOrdersModel == null,
                          isEmpty: data.myOrdersModel?.data?.isEmpty ?? true,
                          builder: (context) => CustomListView(
                            myOrdersModel: data.myOrdersModel,
                            type: 'previous',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ]));
        }));
  }

  _getMyOrders(BuildContext context, String type) async {
    Provider.of<MyOrdersViewModel>(context, listen: false)
        .getMyOrdersApi(context, type);
  }
}
