import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/data/model/response/storesModel.dart';

import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/routing/route.dart';
import '../children/products/products.dart';


class ListOfProminentStores extends StatefulWidget {
  const ListOfProminentStores({Key? key, this.bestStoresModel}) : super(key: key);
  final StoresModel? bestStoresModel;

  @override
  State<ListOfProminentStores> createState() => _ListOfProminentStoresState();
}

class _ListOfProminentStoresState extends State<ListOfProminentStores> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 114.h,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount:widget.bestStoresModel?.data?.length,
          itemBuilder: (context, index) {
            return
              InkWell(
                 onTap: (){push(Productions( oneStore: widget.bestStoresModel?.data?[index],isFrom: 'home',));},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.w),
                  height: 113.h,
                  width: 96.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color:AppColors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 8.h,
                        left: 8.w,
                        bottom: 8.h,
                        right: 8.w),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 72.h,
                          width: 72.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: CachedNetworkImage(
                              imageUrl: widget.bestStoresModel?.data?[index].logo.toString()??'',
                              placeholder: (context, url) =>
                               const Center(child: SizedBox(width:20,height:20,child: CircularProgressIndicator(strokeWidth: 1,))),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                          ),
                        ),
                        Text(
                          widget.bestStoresModel?.data?[index].name.toString()??'',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles().getRegularStyle(fontSize: 14.sp).customColor(AppColors.black),
                        )
                      ],
                    ),
                  ),
                ),
              );
          }),
    );
  }
}
