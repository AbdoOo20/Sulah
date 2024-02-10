
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/resources/locale_keys.g.dart';
import 'package:khedmaty/core/routing/route.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../../core/utils/showToast.dart';
import '../../../../../../../../data/datasource/locale/database_model.dart';
import '../../../../../../../../data/datasource/locale/database_provider.dart';
import '../../../../../../../../data/model/response/one_product_model.dart';
import '../../../../../../../../data/repository/SaveUserData.dart';
import '../../../../../../../../injection.dart';
import '../../../../../../../component/svg_icon.dart';
import '../../../../setting/settingViewModel.dart';
import '../productDetails/productDetails.dart';
import '../productsViewModel.dart';
class CustomCaredProducts extends StatefulWidget {
  const CustomCaredProducts({super.key, required this.model,required this.productIndex,required this.whichScreen});
  final OneProduct? model;
  final int? productIndex;
  final String? whichScreen;
  /// fav , products , latestPro

  @override
  State<CustomCaredProducts> createState() => _CustomCaredProductsState();
}

class _CustomCaredProductsState extends State<CustomCaredProducts> {
  SaveUserData getUserId =getIt();

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      push(
          ProductDetails(oneProduct:widget.model,productIndex: widget.productIndex,whichScreen: widget.whichScreen,));},
      child: Container(
        height: 255.h,
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
            color: AppColors.whiteCard,
            borderRadius: BorderRadius.circular(16.r)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Flexible(
          flex: 4,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Container(
                      height: 116.h,
                      width: 151.w,
                      decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
                      child:
                      SizedBox(
                        height: 116.h,
                        width: 151.w,
                  child:
                  CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl:widget.model?.mainImage.toString() ??  '',
                    placeholder: (context, url) =>
                    const Center(child: SizedBox(width:20,height:20,child: CircularProgressIndicator(strokeWidth: 1,))),
                    errorWidget: (context, url, error) =>  SVGIcon(
                     Assets.errorProducts,
                     height: 70.h,
                     width: 70.w,
                   ),
                  ),
                ),
                    ),
                  ),
                  Positioned(
                    top: 1.h,
                    right: 1.w,
                    child: Container(
                      height: 32.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                         color: AppColors.white,
                          borderRadius: BorderRadius.circular(100.r)),
                      child: InkWell(
                          onTap: (){
                            print('qqqqqqqqqqqq${widget.model?.isFavourite}');
                            if(getUserId.getUserData()?.data?.id !=null){
                              widget.model?.isFavourite==0?
                              ToastUtils.showToast('addedToSuccessfully'.tr()):
                              ToastUtils.showToast('removedFromWishlist'.tr());
                              setState(() {
                                widget.model?.isFavourite==0?widget.model?.isFavourite=1:widget.model?.isFavourite=0;
                              });
                              Provider.of<SettingViewModel>(context, listen: false).addFavoriteProduct(context,widget.model?.id.toString() ?? "",widget.productIndex?? 0,widget.whichScreen,);

                            }else{
                              ToastUtils.showToast('LoginRequired'.tr());
                            }
                       },
                        child: Icon((Icons.favorite),color:(widget.model?.isFavourite==0)? AppColors.gray:Colors.red,
                          size: 23.r,
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1.h,
                    left: 1.w,
                    child:
                    widget.model?.productsOffers !=null ?
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      height: 25.h,
                      // width: 50.w,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(8.r)),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${widget.model?.productsOffers?.value}',
                            style: TextStyles()
                                .getTitleStyle(fontSize: 12.sp,)
                                .customColor(AppColors.white),
                          ),
                          Text(
                            '${widget.model?.productsOffers?.type == "percentage" ? "%" : "sar".tr()}',
                            style: TextStyles()
                                .getTitleStyle(fontSize: 10.sp,)
                                .customColor(AppColors.white),
                          ),
                        ],
                      ),
                  ) :const SizedBox()
                  )
                ],
              ),
            ),
    Flexible(
    flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 5.h),
                Text(
                widget.model?.title ??'',
                style: TextStyles()
                    .getRegularStyle(fontSize: 14.sp,)
                    .customColor(AppColors.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
              ),
                  // Text.rich(
                  //   TextSpan(
                  //     children: <TextSpan>[
                  //       TextSpan(text:
                  //      '${widget.model}'
                  //         , style: TextStyles()
                  //           .getRegularStyle(fontSize: 16.sp,)
                  //           .customColor(AppColors.primaryColor),
                  //       ),
                  //
                  //     ],
                  //   ),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: widget.model?.price.toString() ?? "",
                                  style: TextStyles()
                                    .getTitleStyle(fontSize: 16.sp,)
                                    .customColor(AppColors.black),),
                                TextSpan(text: LocaleKeys.sar.tr(), style: TextStyles()
                                    .getRegularStyle(fontSize: 10.sp,)
                                    .customColor(AppColors.black),
                                ),
                              ],
                            ),
                          ),
                          Container(
                             child:
                             widget.model?.productsOffers !=null ?
                            Text.rich(
                              TextSpan(
                                children: <TextSpan>[
                                    TextSpan(
                                        text: '${(widget.model?.oldPrice)?.round()}',
                                        style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 12.sp,color: AppColors.gray,overflow: TextOverflow.ellipsis,)),
                                    TextSpan(text: '${widget.model?.price.toString() ?? ""}'.length > 4 ? "":LocaleKeys.sar.tr(), style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 12.sp,color: AppColors.gray,overflow: TextOverflow.ellipsis,)
                                    ),
                                ],
                              ),
                            )
                            :const SizedBox()
                          ),
                        ],
                      ),
                     (widget.model?.user?.status ==1) ?
                          Consumer<CartProvider>(builder: (context, cart, child) => InkWell(
                            onTap: (){
                              CartItems cartItems =CartItems(
                                id: widget.model?.id ?? 0,
                                image: widget.model?.mainImage ?? "",
                                name: widget.model?.title ?? "",
                                price: double.parse(widget.model?.price.toString() ?? ""),
                                quantity: 1,
                                storeId: widget.model?.user?.id ?? 0,
                                storeName: widget.model?.user?.name ?? "",
                                storeImage: widget.model?.user?.logo ?? "",
                                orderStatus: widget.model?.type ?? "",
                              );
                              if(context.read<CartProvider>().cartItems.isEmpty){
                                cart.addToCart(cartItems,context);
                              }
                              else{
                                for(int i =0;i<context.read<CartProvider>().cartItems.length;i++){
                                  if(context.read<CartProvider>().cartItems[i].storeId==(widget.model?.user?.id ?? -1)){
                                    cart.addToCart(cartItems,context);
                                    return;
                                  }else{
                                    CartProvider.alertDialogAddFromAnotherStore(context,cartItems);
                                    return;
                                  }
                                }
                              }
                              var cartCounter = context.read<CartProvider>();
                              cartCounter.updateCountProductInTheCart();
                        },
                        child: SVGIcon(
                          Assets.shoppingCartIcom,
                          height: 32.h,
                          width: 32.w,
                        ),
                      ))
                          :const SizedBox()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
