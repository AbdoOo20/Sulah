// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:khedmaty/core/extensions/num_extensions.dart';
// import 'package:khedmaty/core/routing/route.dart';
// import '../../../../../../core/res/text_styles.dart';
// import '../../../../../../core/resources/app_colors.dart';
// import '../../../../../core/helper/socialMediaHelper.dart';
// import '../../../../../core/resources/app_assets.dart';
// import '../../../../component/spaces.dart';
// import '../../../../component/svg_icon.dart';
// import '../../chat/chatScreen.dart';
//
// class PhoneCared extends StatelessWidget {
//   const PhoneCared(
//       {Key? key, required this.name, required this.phone, required this.image, required this.userId, required this.driverId, required this.storeId, required this.orderId})
//       : super(key: key);
//   final String name;
//   final String phone;
//   final String image;
//   final String userId;
//   final String driverId;
//   final String storeId;
//   final String orderId;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 10.w),
//       //elevation: 2,
//       decoration: BoxDecoration(border: Border.all(width: 1.w,color: AppColors.main30),borderRadius: BorderRadius.circular(12.r),),
//       child: Container(
//        // margin: EdgeInsets.only(top: 10.w),
//         padding: EdgeInsets.all(16.r),
//         clipBehavior: Clip.hardEdge,
//         decoration: BoxDecoration(
//           // boxShadow: [BoxShadow(blurRadius:15 .r,spreadRadius: 0.0003.r,blurStyle: BlurStyle.outer)],
//             borderRadius: BorderRadius.circular(12.r),
//             color: AppColors.white),
//         child: Row(
//           children: [
//             SizedBox(width: 48.w,height: 48.h,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12.r),
//                 child: CachedNetworkImage(
//                   fit: BoxFit.fill,
//                   imageUrl: image,
//                   placeholder: (context, url) =>
//                   new Center(child: SizedBox(width:20.w,height:20.h,child: CircularProgressIndicator(strokeWidth: 1,))),
//                   errorWidget: (context, url, error) =>
//                       Image.asset(
//                         Assets.person,
//                         height: 48.h,
//                         width: 48.w,
//                       ),
//                 ),
//               ),
//             ),
//             HorizontalSpace(12.w),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   name,
//                   style: TextStyles()
//                       .getTitleStyle(fontSize: 14.sp)
//                       .customColor(AppColors.black),
//                 ),
//                 VerticalSpace(4.h),
//                 Text(
//                   phone,
//                   style: TextStyles()
//                       .getRegularStyle(fontSize: 12.sp)
//                       .customColor(AppColors.gray),
//                 ),
//               ],
//             ),
//             Spacer(),
//             Row(
//               children: [
//                 IconButton(
//                   padding: EdgeInsets.zero,
//                   onPressed: () {
//                     SocialMediaHelper().launchPhoneCall(phone);
//                   },
//                   icon: Icon(
//                     Icons.call,
//                     color: AppColors.blue,
//                     size: 24.r,
//                   ),
//                 ),
//                 InkWell(onTap: (){push(ChatScreen(
//                   name: name,
//                   storeId: storeId,userId: userId,orderId: orderId,driverId: driverId,));},
//                     child: SVGIcon(Assets.iconChat,width: 44.w,height: 44.h,))
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
