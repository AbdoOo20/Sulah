import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';

import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../component/svg_icon.dart';



class BranchBio extends StatefulWidget {
  const BranchBio({Key? key, required this.storeImage, required this.storeName, required this.preparationTime}) : super(key: key);
  final String storeImage;
  final String storeName;
  final String preparationTime;


  @override
  State<BranchBio> createState() => _BranchBioState();
}

class _BranchBioState extends State<BranchBio> {
  @override
  Widget build(BuildContext context) {
    print("llkkkkkkk----${widget.preparationTime}");
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.r),
      child: Container(height: 88.h,
        padding: EdgeInsets.all(12.r),
        margin: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r),border: Border.all(width: .7.w,color: AppColors.inactiveColor),color: AppColors.main30),
        child:Row(
          children: [
            Container(height: 64.h,width:64.w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl:widget.storeImage,
                placeholder: (context, url) =>
                new Center(child: SizedBox(width:20,height:20,child: CircularProgressIndicator(strokeWidth: 1,))),
                errorWidget: (context, url, error) =>
                    SVGIcon(
                      Assets.logo,
                      height: 100.h,
                      width: 100.w,
                    ),
              ), ),
            SizedBox(width: 10.w,),
            SizedBox(width: MediaQuery.of(context).size.width*.6,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.store.tr(),
                        style: TextStyles()
                            .getRegularStyle(fontSize: 12.sp)
                            .customColor(AppColors.gray),
                      ),
                      Text(
                        widget.storeName,
                        style: TextStyles()
                            .getTitleStyle(fontSize: 16.sp)
                            .customColor(AppColors.black),
                      ),
                    ],),
                  widget.preparationTime == "0 " ? SizedBox() :
                  Row(
                    children: [
                      SVGIcon(Assets.time,height: 20.h,width: 20.w,),
                      SizedBox(width: 5.w,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            LocaleKeys.preparationTime.tr(),
                            style: TextStyles()
                                .getRegularStyle(fontSize: 12.sp)
                                .customColor(Colors.red),
                          ),
                          Text(
                            // '${widget.preparationTime}''${LocaleKeys.hours.tr()}',
                            widget.preparationTime,
                            style: TextStyles()
                                .getTitleStyle(fontSize: 16.sp)
                                .customColor(AppColors.black),
                          ),
                        ],),
                    ],
                  )
                ],
              ),
            )],) ,),
    );
  }
}
