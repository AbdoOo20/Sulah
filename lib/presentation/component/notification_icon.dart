// import 'package:adhmn/core/extensions/num_extensions.dart';
// import 'package:delivery_point_provider/core/extensions/num_extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// import '../../../core/resources/app_assets.dart';
// import '../../../core/resources/values_manager.dart';
// import '../../../core/routing/navigation_services.dart';
// import '../../../core/routing/routes.dart';
// import '../../core/resources/values_manager.dart';
// import '../../core/routing/navigation_services.dart';
// import '../../core/routing/routes.dart';
// import '../../generated/assets.dart';
//
// class NotificationIcon extends StatelessWidget {
//   final int _count;
//
//   const NotificationIcon({
//     Key? key,
//     required int count,
//   })  : _count = count,
//         super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: kScreenPaddingNormal.w),
//       width: 48.r,
//       height: 48.r,
//       decoration: BoxDecoration(
//           color: Theme.of(context).primaryColorLight,
//           borderRadius: const BorderRadius.all(Radius.circular(kFormRadius))),
//       // padding: const EdgeInsets.symmetric(horizontal: kScreenPaddingNormal),
//
//       child: Center(
//         child: GestureDetector(
//           child: Stack(clipBehavior: Clip.none, children: [
//             // Gif(image:const  AssetImage(Assets.gifGifBell),height: 28, width: 28,autostart: _count>0?Autostart.loop  :Autostart.no,),
//             SvgPicture.asset(
//               Assets.svgNotificationIcon,
//               height: 24.h,
//               width: 22.w,
//             ),
//             /*
//            if(_count>0)
//               Positioned(
//                 right: -4,
//                 top: 0,
//                 child: Container(
//                   width: 16.r,
//                   height: 16.r,
//                   padding: const EdgeInsets.all(4),
//                   decoration: BoxDecoration(shape: BoxShape.circle, color: Theme.of(context).primaryColor,border: Border.all(color: Theme.of(context).primaryColorLight)),
//                   child: Text('$_count', style: TextStyle(color: Theme.of(context).backgroundColor, fontSize: 8)),
//                 ),
//               ),
//               */
//           ]),
//           onTap: () => NavigationService.push(Routes.notificationsScreen),
//         ),
//       ),
//     );
//   }
// }
