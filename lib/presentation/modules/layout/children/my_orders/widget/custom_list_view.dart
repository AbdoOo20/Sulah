import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../../data/model/response/myOrdersModel.dart';

import '../my_orders_view_model.dart';
import 'custom_cared.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({Key? key, required this.type, this.myOrdersModel})
      : super(key: key);
  final MyOrdersModel? myOrdersModel;
  final String? type;

  _getMyOrders(BuildContext context, String type) async {
    Provider.of<MyOrdersViewModel>(context, listen: false)
        .getMyOrdersApi(context, type);
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = context.watch<MyOrdersViewModel>().isLoading;
    print('htytytytytytytytytyty${myOrdersModel?.data?.length}');
    return
        //   isLoading ? Center(child: Padding(padding: EdgeInsets.all(8.0.r), child: CircularProgressIndicator(color: AppColors.primaryColor,),),) :
        // myOrdersModel?.data == null ? Container(width: 40.w,height: 40.h,color: AppColors.primaryColor,): myOrdersModel?.data?.length == 0 ? NoDataScreen() :

        ListView.builder(
      itemCount: myOrdersModel?.data?.length, //from API
      itemBuilder: (context, index) {
        return RefreshIndicator(
            onRefresh: () async => await _getMyOrders(
                context, type == 'current' ? 'current' : 'previous'),
            child: Padding(
              padding: EdgeInsets.only(top: 24.h),
              child: CustomCared(
                data: myOrdersModel?.data?[index],
                type: type,
              ),
            ));
      },
    );
  }
}
