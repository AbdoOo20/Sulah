import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';


import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/app_colors.dart';
import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../component/svg_icon.dart';
import '../../../homeViewModel.dart';
import '../productsViewModel.dart';

class ListOfCat extends StatefulWidget {
  const ListOfCat({Key? key}) : super(key: key);

  @override
  State<ListOfCat> createState() => _ListOfProductsState();
}

class _ListOfProductsState extends State<ListOfCat> {
  bool click = false ;
  @override
  @override
  Widget build(BuildContext context) {
    return
      Consumer<HomeViewModel>(builder: (context, data, child) {
        return
        //   item.categoriesModel?.data == null
        //     ? const Center(child:SizedBox()) :
        // item.categoriesModel?.data?.length == 0
        //     ? SizedBox()
        //     :
      Padding(
      padding:  EdgeInsets.symmetric(vertical: 12.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.main20,
        ),
        height: 64.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:5,
            // itemCount:item.categoriesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                EdgeInsets.all(8.r),
                child: GestureDetector(
                  onTap: () {
                    data.isSelectCat=index;
                    data.catIdSelect=data.categoriesList[index].id.toString();
                    String search =Provider.of<ProductsViewModel>(context, listen: false).searchController.text;
                    print('rtrtrtrtrtrt$index');
                    print('rtrtrtrtrtrt${data.catIdSelected}');
                    Provider.of<ProductsViewModel>(context, listen: false).getProducts(context, search, data.categoriesList[index].id.toString(),'',);
                  },
                  child: Container(
                    height: 48.h,
                    decoration: BoxDecoration(
                      // border: Border.all(width: 1.5.w,color: AppColors.grayLight),
                        borderRadius: BorderRadius.circular(12.r),
                color:(data.isSelectCat == index)? AppColors.primaryColor:AppColors.white),
                    child: Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                            EdgeInsets.only(left: 8.w),
                            child:
                            data.categoriesList[index].title == 'all'.tr() ? const SizedBox():
                            SizedBox(
                              height: 32.h,
                              width: 32.w,
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(12.5.r),
                                child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl: '${data.categoriesList[index].image}',
                                    placeholder: (context, url) =>
                                    const Center(child: SizedBox(width:20,height:20,child: CircularProgressIndicator(strokeWidth: 1,))),
                                    errorWidget: (context, url, error) =>
                                        const SVGIcon(Assets.errorProducts)
                                    // Icon(Icons.error),
                                    ),
                              ),
                            ),
                          ),
                          Text('${data.categoriesList[index].title}',
                              style: TextStyles()
                                  .getRegularStyle(fontSize: 12.sp)
                                  .customColor(
                                  data.isSelectCat == index ? AppColors.white:AppColors.black
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),

      ),
    );});
  }
}
