import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/core/resources/app_assets.dart';
import 'package:sulah/core/resources/locale_keys.g.dart';
import 'package:sulah/presentation/component/component.dart';
import 'package:provider/provider.dart';


import '../../../../../../../core/res/text_styles.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/routing/route.dart';
import '../../../../../../../core/utils/showToast.dart';
import '../../../../../../../data/repository/SaveUserData.dart';
import '../../../../../../../injection.dart';
import '../../../../../auth/login/login.dart';
import '../billScreen/Bill_Screen.dart';
import '../shoppingCard/shopping_cared_view_model.dart';
import 'widget/choosePaymentMethod.dart';
import 'widget/comments.dart';
import 'widget/delivery_Address.dart';
import 'widget/listProducts.dart';
import 'widget/payment_Method.dart';
class PaymentDelivery extends StatefulWidget {
 final num totalProductsPrice;
  const PaymentDelivery({Key? key, required this.totalProductsPrice}) : super(key: key);
  @override
  State<PaymentDelivery> createState() => _PaymentDeliveryState();
}
class _PaymentDeliveryState extends State<PaymentDelivery> {
  SaveUserData saveUserData =getIt();
  bool isDelivery = true;
  bool isSwitchedReceivedAtTime = false;
  @override
  Widget build(BuildContext context) {
    bool   isLoading = Provider.of<ShoppingCaredViewModel>(context, listen: true).isLoading;
    return CustomScaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.paymentDelivery.tr(),
          color: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child:ListAnimator(
                  children: [
                    ListProducts(),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(width: 115.w,image: Assets.deleverCar,imageColor: isDelivery ? AppColors.white : AppColors.black,fontSize: 12.sp,borderRadius: 16.r,
                          onTap: (){
                            setState(() {isDelivery = true;print("ggggg__${isDelivery})");});}
                          ,title: LocaleKeys.deliver.tr(),textColor: isDelivery ?
                          AppColors.white : AppColors.black ,color:isDelivery ?
                          AppColors.primaryColor:AppColors.grayLight,),
                        CustomButton(width: 220.w,image: Assets.storeIcon,imageColor: isDelivery ? AppColors.black : AppColors.white,borderRadius: 16.r,
                          textColor: isDelivery ? AppColors.black : AppColors.white ,fontSize: 12,
                          onTap: (){
                            setState(() {isDelivery = false;print("ggggg__${isDelivery})");});}
                          ,title: LocaleKeys.pickUpFromStore.tr(),color: isDelivery ? AppColors.grayLight:AppColors.primaryColor,),
                      ],
                    ),
                    isDelivery?
                    InkWell(onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlacePicker(
                              apiKey: "AIzaSyA_9WM91qFprwhIqhU3WxKrGzJ7yi0BYRY",
                              onPlacePicked: (result) {
                                setState(() {});
                                Provider.of<ShoppingCaredViewModel>(context, listen: false).saveData(result.formattedAddress.toString(),result.geometry?.location.lat ?? 0.0,result.geometry?.location.lng ?? 0.0);
                                Provider.of<ShoppingCaredViewModel>(context, listen: false).refreshData();
                                pushReplacement(PaymentDelivery(totalProductsPrice: widget.totalProductsPrice));
                              },
                              zoomControlsEnabled: true,
                              initialPosition: LatLng(saveUserData.getLatitude(),saveUserData.getLongitude()),
                              useCurrentLocation: false,
                              enableMapTypeButton: true,
                            ),
                          ),
                        );
                      },
                        child: const DeliveryAddress()):const SizedBox(),
                    InkWell(onTap:(){showChoosePaymentMethod(context);},
                        child: const PaymentMethod()),
                     const Comments(),
                  ],
                ),
              ),
            ),
            Container(
              height: 69.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 1), //(x,y)
                    blurRadius: 10,
                  ),
                ],
              ),
              padding:
              EdgeInsets.only(top: 8.h, bottom: 8.h, left: 16.w, right: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        LocaleKeys.theTotal.tr(),
                        style: TextStyles()
                            .getRegularStyle(
                          fontSize: 18.sp,
                        )
                            .customColor(AppColors.black),
                      ),
                      Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '${double.parse(widget.totalProductsPrice.toString()).toPrecision(1)}',
                              style: TextStyles()
                                  .getTitleStyle(
                                fontSize: 18.sp,
                              )
                                  .customColor(AppColors.black),
                            ),
                            TextSpan(
                              text: LocaleKeys.sar.tr(),
                              style: TextStyles()
                                  .getRegularStyle(
                                fontSize: 12.sp,
                              )
                                  .customColor(AppColors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  CustomButton(
                    loading: isLoading,
                    color: AppColors.primaryColor,
                    onTap: (){
                      (saveUserData.getUserData()?.data?.id !=null)? call() :pushAndRemoveUntil(Login());
                    },width: 74.w,height: 45.h,title:LocaleKeys.confirm.tr())
                ],
              ),
            ),
          ],
        ));
  }
  call(){
    if  ( saveUserData.getDistance()=='') {
      ToastUtils.showToast(LocaleKeys.locationSpecified.tr());
    } else if (Provider.of<ShoppingCaredViewModel>(context, listen:false ).paymentType == null) {
      ToastUtils.showToast(LocaleKeys.paymentMustSelected.tr());
    }  else {
      push(BillScreen(isDelivery: isDelivery));
    }
  }
  Future<dynamic> showChoosePaymentMethod(BuildContext context) async {
    return showModalBottomSheet(
      // expand: false,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const SafeArea(child: ChoosePaymentMethod()),
    );
  }

}
