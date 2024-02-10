import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';

import '../../core/res/text_styles.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/app_colors.dart';
import '../../core/resources/locale_keys.g.dart';
import '../../core/routing/route.dart';
import '../modules/layout/ButtonNavBar.dart';

class DialogDone extends StatefulWidget {
  const DialogDone({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  State<DialogDone> createState() => _DialogDoneState();
}

class _DialogDoneState extends State<DialogDone> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
     pushAndRemoveUntil(const CustomBottomNavigationBar(0));
    });
  }
 // final Widget widget;
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(24.r)),
        content: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Assets.paySuccessfully,height: 250.h,),
              SizedBox(width: 250.w,
                child: Text(
                  widget.title??'',
                  style: TextStyles()
                      .getRegularStyle(fontSize: 13.sp)
                      .customColor(AppColors.black),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,textAlign: TextAlign.center,
                ),
              ),
              // SizedBox(height: 12.h,),
              // Row(mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //    Container(child: widget,),
              //     Icon(Icons.arrow_forward_ios,color: AppColors.second,size: 12.r,)
              //   ],
              // ),

            ],),),
      );
  }
}
