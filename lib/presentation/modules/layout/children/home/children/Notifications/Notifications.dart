import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/routing/route.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/app_loader.dart';
import '../../../../../../../core/res/text_styles.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../component/component.dart';
import '../../../../../../component/custom_scaffold.dart';
import '../../../my_orders/orderDetails/my_order_details.dart';
import '../../homeViewModel.dart';


class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  void initState() {
    Provider.of<HomeViewModel>(context, listen: false).getNotification(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = Provider.of<HomeViewModel>(context, listen: true).isLoading;
    return CustomScaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.notification.tr(),
          titleColor: AppColors.black,
          color: AppColors.white,
        ),
       body: Consumer<HomeViewModel>(
           builder: (context, data, child) {
             return RefreshIndicator(
               onRefresh: () async {
                 Provider.of<HomeViewModel>(context, listen: false).getNotification(context);
               },
               child:isLoading == false? Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: data.notificationModel?.data?.length==0? NoDataScreen(): ListView.builder(
                   itemCount: data.notificationModel?.data?.length,
                   itemBuilder: (context, index) {
                     return Padding(
                       padding:
                       EdgeInsets.only(top: 16.h, right: 12.w, left: 12.w),
                       child: InkWell(
                         onTap: (){
                           if(data.notificationModel?.data?[index].type == "order"){
                           push(MyOrderDetails(orderId: data.notificationModel?.data?[index].orderId.toString() ?? ""));}
                         },
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text(
                               data.notificationModel?.data?[index].body
                                   .toString() ??
                                   '',
                               style: TextStyles()
                                   .getRegularStyle(fontSize: 14.sp)
                                   .customColor(AppColors.gray),
                             ),
                             Row(
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 Text(
                                   data.notificationModel?.data?[index].createdAt.toString()??'',
                                   style: TextStyles()
                                       .getRegularStyle(fontSize: 14.sp)
                                       .customColor(AppColors.white),
                                 ),

                               ],
                             ),
                             Container(
                               margin: EdgeInsets.only(top: 12.h),
                               decoration: const BoxDecoration(
                                   border: Border(
                                       top:
                                       BorderSide(color: AppColors.primaryColor))),
                             )
                           ],
                         ),
                       ),
                     );
                   },
                 ),
               ):const AppLoader(),
             );
           }));
  }
}
