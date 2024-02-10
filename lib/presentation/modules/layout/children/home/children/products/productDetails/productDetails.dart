
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/resources/app_assets.dart';
import 'package:khedmaty/core/resources/locale_keys.g.dart';
import 'package:khedmaty/presentation/component/component.dart';
import 'package:khedmaty/presentation/component/svg_icon.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../../core/utils/showToast.dart';
import '../../../../../../../../data/datasource/locale/database_model.dart';
import '../../../../../../../../data/datasource/locale/database_provider.dart';
import '../../../../../../../../data/model/response/one_product_model.dart';

import '../../../../../../../../data/repository/SaveUserData.dart';
import '../../../../../../../../injection.dart';
import '../productsViewModel.dart';
import 'widget/custom_similar_products.dart';
import 'widget/detailsCared.dart';
import 'widget/priceCard.dart';
import 'widget/storeCard.dart';
class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.oneProduct,required this.productIndex, required this.whichScreen }) : super(key: key);
  final OneProduct? oneProduct;
  final int? productIndex;
  final String? whichScreen;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  SaveUserData getUserId =getIt();
  bool click = false ;
  @override
  void initState() {
    super.initState();
    click = widget.oneProduct?.isFavourite==1 ? true:false;
    _loadData(context);
  }
  _loadData(context){
    Provider.of<ProductsViewModel>(context, listen: false).getOneProduct(context,widget.oneProduct?.id.toString()??'');
    Provider.of<ProductsViewModel>(context, listen: false).getSimilarProducts(context,widget.oneProduct?.id.toString()??'');
  }
  @override
  Widget build(BuildContext context) {
    final  provider = Provider.of<ProductsViewModel>(context, listen: true);
    final  caredProvider=Provider.of<ProductsViewModel>(context, listen: false).isLoading;
    return CustomScaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.productDetails.tr(),
        color: Colors.transparent,
      ),
      body:Consumer<ProductsViewModel>(
          builder: (context, data, child) => RefreshIndicator(
          onRefresh: () async => await _loadData(context),
    child: ScreenStateLayout(
    isLoading: data.oneProductModel == null ,
    isEmpty: data.oneProductModel?.data == null ,
    builder: (context) =>Column(
        children: [
          Expanded(
              child: ListAnimator(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 234.h,
                              margin: EdgeInsets.only(bottom: 70.h),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
                              child:ClipRRect(borderRadius: BorderRadius.circular(16.r),
                                child: CarouselSlider.builder(
                                    itemCount: data.image.length,
                                    itemBuilder: (_, index, realIndex) {
                                      final urlImage = data.image[index];
                                      return Container(
                                        width: double.infinity,
                                        height: 234.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(24.r),
                                        ),
                                        padding: const EdgeInsets.symmetric(horizontal: (3)),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20.0.r),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.cover,
                                            imageUrl: urlImage,
                                            placeholder: (context, url) =>
                                            const Center(child: SizedBox(width:20,height:20,child: CircularProgressIndicator(strokeWidth: 1,))),
                                            errorWidget: (context, url, error) =>  SVGIcon(
                                              Assets.errorProducts,
                                              height: 170.h,
                                              width: 170.w,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    options: CarouselOptions(
                                      height: 234.h,
                                      autoPlay: true,
                                      aspectRatio: 2,
                                      pageSnapping: false,
                                      initialPage: 0,
                                      autoPlayInterval: const Duration(seconds: 3),
                                      enlargeCenterPage: true,
                                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                                      viewportFraction: 0.9,
                                    ))

                              ),
                            ),

                            Positioned(bottom: 15,left: 10,right: 10,
                                child:
                                StoreCard(oneProductStore: data.oneProductModel?.data?.user))
                          ],
                        ),
                         DetailsCared(oneProduct:data.oneProductModel?.data),

                        Container(
                          padding: EdgeInsets.all(5.r),
                          // height: 154.h,
                          margin: EdgeInsets.symmetric(vertical: 8.h),
                          color: AppColors.white,
                          child:Html(data: data.oneProductModel?.data?.description??'')
                        ),
                        PriceCard(data:data.oneProductModel?.data),
                        const CustomSimilarProducts()
                      ],
                    )
                )],
              )),
          Container(height: 69.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft:Radius.circular(16.r),topRight: Radius.circular(16.r),),
              color: AppColors.white,boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0,1), //(x,y)
                  blurRadius: 10,
                ),
              ],),

            padding: EdgeInsets.only(top: 8.h,bottom: 8.h,left: 16.w,right: 16.w),
            child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(children: [Text(
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
                TextSpan(text: '${double.parse(((data.oneProductModel?.data?.price??0)*provider.quantity).toString()).toPrecision(1)}',
                  style: TextStyles()
                      .getTitleStyle(fontSize: 18.sp,)
                      .customColor(AppColors.black),),
                TextSpan(text: LocaleKeys.sar.tr(), style: TextStyles()
                    .getRegularStyle(fontSize: 12.sp,)
                    .customColor(AppColors.black),
                ),
              ],
            ),
          )
        ],),
      !caredProvider?
      Consumer<CartProvider>(builder: (context, cart, child) => InkWell(
        onTap: (){
          CartItems cartItem=   CartItems(
            id: data.oneProductModel?.data?.id ?? 0,
            image: data.oneProductModel?.data?.mainImage ?? "",
            name: data.oneProductModel?.data?.title ?? "",
            price: double.parse(data.oneProductModel?.data?.price.toString() ?? ""),
            quantity: provider.quantity,
            storeId: data.oneProductModel?.data?.user?.id ?? 0,
            storeName:  data.oneProductModel?.data?.user?.name ?? "",
            storeImage:  data.oneProductModel?.data?.user?.logo ?? "",
            orderStatus:  data.oneProductModel?.data?.user?.type ?? "",
          );
          if( data.quantity != 0) {
            if( data.oneProductModel?.data?.user?.status == 0){
              ToastUtils.showToast("storeIsCurrentlyUnavailable".tr());
            }
           else if(provider.quantity>=1){
              if(context.read<CartProvider>().cartItems.isEmpty){
                cart.addToCart(cartItem,context);
              }
              else{
                for(int i =0;i<context.read<CartProvider>().cartItems.length;i++){
                  if(context.read<CartProvider>().cartItems[i].storeId==( data.oneProductModel?.data?.user?.id ?? -1)){
                    cart.addToCart(cartItem,context);
                    return;
                  }else{
                    CartProvider.alertDialogAddFromAnotherStore(context,cartItem);
                    return;

                  }
                }
              }

            } else{
              ToastUtils.showToast(LocaleKeys.addQuantity.tr());
            }
          }else{
            ToastUtils.showToast(LocaleKeys.addQuantity.tr());
          }
          var cartCounter = context.read<CartProvider>();
          cartCounter.updateCountProductInTheCart();
        },
        child: Container(
          height: 45.h,
          padding:EdgeInsets.all(10.r) ,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r),color: AppColors.primaryColor),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SVGIcon(Assets.addToCart,height: 19.h,width: 19.w,color: AppColors.white,),
              Text(
                (data.oneProductModel?.data?.isShow != 0) ? LocaleKeys.addToCart.tr() :
                LocaleKeys.productIsNotAvailableInThisBranch.tr(),
                style: TextStyles()
                    .getRegularStyle(
                  fontSize: 15.sp,
                )
                    .customColor(AppColors.white),
              ),
            ],)
          ,),
      )):Center(
      child: SizedBox(
      height: 40.h,
        width: 40.w,
        child: const CircularProgressIndicator(),
      ),
    ),
    ],),
        ),
        ],
        )
        ))));
  }
}