import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/presentation/component/component.dart';

import 'package:provider/provider.dart';

import '../../../../../../core/resources/resources.dart';
import '../../../../../dialog/cancel_request_dialog.dart';
import '../my_orders_view_model.dart';
import 'widgets/caredTittle.dart';
import 'widgets/orderBillCard.dart';
import 'widgets/state_cared.dart';

class MyOrderDetails extends StatefulWidget {
  const MyOrderDetails({
    Key? key,
    required this.orderId,
  }) : super(key: key);
  final String? orderId;

  @override
  State<MyOrderDetails> createState() => _MyOrderDetailsState();
}

class _MyOrderDetailsState extends State<MyOrderDetails> {
  @override
  void initState() {
    super.initState();
    _loadData(context);
  }
  _loadData(context)async{
   await Provider.of<MyOrdersViewModel>(context, listen: false)
        .getOneOrderApi(context, widget.orderId.toString());
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.orderDetails.tr(),
        ),
        body: Consumer<MyOrdersViewModel>(builder: (context, orderData, child) {
              return
                 RefreshIndicator(
                    onRefresh: () async => await _loadData(context),
          child: ScreenStateLayout(
          isLoading: orderData.oneOrderModel == null,
          builder: (context) =>
              Column(
                children: [
                  Expanded(
                    child: ListAnimator(
                        children: [
                           CustomStateCared(
                             title:
                             // orderData.oneOrderModel?.data?.isPaid == false ?LocaleKeys.payFiled:
                             orderData.oneOrderModel?.data?.status == 'new'?LocaleKeys.received:
                             orderData.oneOrderModel?.data?.status == 'accept'?LocaleKeys.approved:
                             orderData.oneOrderModel?.data?.status == 'refuse' ?LocaleKeys.orderCanceledFromStore:
                             orderData.oneOrderModel?.data?.status == 'do_shipping' ?LocaleKeys.preparing:
                             orderData.oneOrderModel?.data?.status == 'end_shipping' ?LocaleKeys.representative:
                             orderData.oneOrderModel?.data?.status == 'delivery_progress' ?LocaleKeys.progress:
                             orderData.oneOrderModel?.data?.status == 'driver_accepted' ?'orderAccepted':
                             orderData.oneOrderModel?.data?.status == 'ended' ?LocaleKeys.done:
                             orderData.oneOrderModel?.data?.status == 'canceled' ?LocaleKeys.orderCanceled:
                             orderData.oneOrderModel?.data?.status == 'progress_done' ?LocaleKeys.prepared:
                             orderData.oneOrderModel?.data?.status == 'driver_canceled' ?LocaleKeys.RequestDriverCancelled:
                             orderData.oneOrderModel?.data?.status == 'delivered' ?'isDeliver':
                             LocaleKeys.done,
                             orderId: widget.orderId.toString(),
                             storeId: orderData.oneOrderModel?.data?.store?.id.toString() ?? "",
                                ),
                           if(orderData.oneOrderModel?.data?.status == 'ended')
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if(orderData.oneOrderModel?.data?.isStoreRated == 0)
                                CustomTextButton(
                                  width: 300.w,
                                onPressed: () {showRateDialog(context,
                                orderId:orderData.oneOrderModel?.data?.id.toString()??'' ,
                                storeId: orderData.oneOrderModel?.data?.store?.id.toString()??''
                                );},
                                text:'shopRate'.tr(),
                                textColor: AppColors.primaryColor,
                                textSize: 14.sp,
                                borderColor: AppColors.primaryColor,
                                icon: Assets.stare,
                              ),
                            ],
                          ),
                          CustomCaredTittle(
                            data: orderData.oneOrderModel?.data,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: 16.w, left: 16.w, bottom: 22.h),
                            child: OrderBillCard(
                              oneOrderModel: orderData.oneOrderModel?.data,
                            ),
                          )
                        ],
                      ),
                  ),
                ],
              )));
        }));
  }
}
