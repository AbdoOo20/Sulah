import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';


import '../../../../../../core/resources/resources.dart';
import '../../../../../../data/repository/SaveUserData.dart';
import '../../../../../../injection.dart';
import '../../../../../component/svg_icon.dart';

import '../homeViewModel.dart';
class CustomAppBarHome extends StatefulWidget {
  const CustomAppBarHome({super.key});

  @override
  State<CustomAppBarHome> createState() => _CustomAppBarHomeState();
}

class _CustomAppBarHomeState extends State<CustomAppBarHome> {
  SaveUserData getUserId = getIt();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SVGIcon(
            Assets.logo,
            width: 98.w,
            height: 44.h,
          ),
          // Consumer<HomeViewModel>(builder: (context, count, child) {
          //   return InkWell(
          //       onTap: () {
          //         // (getUserId.getUserData()?.data?.id != null)
          //         //     ? push(const Notifications())
          //         //     : push(const Login());
          //       },
          //       child: Stack(children: <Widget>[
          //         Container(
          //           height: 48.h,
          //           width: 48.w,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(16.r),
          //             color: AppColors.grayLight,
          //           ),
          //           child: SVGIcon(
          //             Assets.notificationIcon,
          //             height: 24.h,
          //             width: 22.2.w,
          //           ),
          //         ),
          //         // (getUserId.getUserData()?.data?.id != null)
          //         //     ? Positioned(
          //         //   top: 5,
          //         //   right: 5,
          //         //   child:
          //         //   // count.sliderModel?.data != null &&
          //         //   //     count.sliderModel?.data?.n != '' ?
          //         //   // Container(
          //         //   //   padding: const EdgeInsets.all(2),
          //         //   //   decoration: BoxDecoration(
          //         //   //     borderRadius:
          //         //   //     BorderRadius.circular(100.r),
          //         //   //     border: Border.all(
          //         //   //         width: .8.w,
          //         //   //         color: AppColors.grayLight),
          //         //   //     color: AppColors.primaryColor,
          //         //   //   ),
          //         //   //   child: Center(
          //         //   //     child: Text(
          //         //   //       '0',
          //         //   //       style: TextStyles()
          //         //   //           .getTitleStyle(fontSize: 9.sp)
          //         //   //           .customColor(AppColors.white),
          //         //   //     ),
          //         //   //   ),
          //         //   // )
          //         //       // : const SizedBox(),
          //         // )
          //         //     : const SizedBox(),
          //       ]));
          // }),
       
        ],
      ),
    );
  }
}
