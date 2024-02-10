

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';

import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../component/svg_icon.dart';



class CustomCaredCategory extends StatefulWidget {
  const CustomCaredCategory({super.key, required this.url, required this.title, });
  final String url;
  final String title;


  @override
  State<CustomCaredCategory> createState() => _CustomCaredCategoryState();
}

class _CustomCaredCategoryState extends State<CustomCaredCategory> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 134.h,
     padding: EdgeInsets.all(5.r),
     alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.transparent,
      ),
      child:
      Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child:Container(
                color: AppColors.caredColor,
                width: 103.w,
                height: 88.h,
                child: SizedBox(
                  height: 64.h,width: 64.w,
                  child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl:  widget.url,
                      placeholder: (context, url) =>
                          const Center(child: SizedBox(width:20,height:20,child: CircularProgressIndicator(strokeWidth: 1,))),
                      errorWidget: (context, url, error) =>
                          const SVGIcon(Assets.errorProducts)
                    // Icon(Icons.error),
                  ),
                ),
              ),
          ),
          SizedBox(height: 3.h),
          Text(
            widget.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyles()
                .getRegularStyle(
              fontSize: 12.sp,
            )
                .customColor(AppColors.black),
          ),
        ]
      ),
    );
  }
}
