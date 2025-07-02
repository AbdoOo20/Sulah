import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/core/res/text_styles.dart';
import 'package:sulah/core/resources/resources.dart';
import '../spaces.dart';
import '../svg_icon.dart';

class AlertPup extends StatefulWidget {
  const AlertPup({Key? key, required this.title, required this.body, required this.image}) : super(key: key);
final String title;
final String body;
final String image;
  @override
  _AlertPupState createState() => _AlertPupState();
}

class _AlertPupState extends State<AlertPup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.r))),
      content: Builder(
        builder: (context) {
          var height = MediaQuery.of(context).size.height;
          var width = MediaQuery.of(context).size.width;

          return Container(
            //height: height - 670,
            width: width - 32,
            padding: EdgeInsets.only(
                top: 16.h, bottom: 20.h, right: 24.w, left: 24.w),
            child: Row(
              children: [
                SVGIcon(
                  widget.image,
                  // Assets.succes,
                  width: 32.w,
                  height: 32.h,
                ),
                HorizontalSpace(18.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          // 'success'.tr(),
                          style: const TextStyle()
                              .titleStyle(fontSize: FontSize.s12.sp)
                              .customColor(AppColors.primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(height:12.w),
                    Text(
                      widget.body,
                      // 'addedSuccessfully'.tr(),
                      style: const TextStyle()
                          .bodyStyle(fontSize: FontSize.s14.sp)
                          .customColor(AppColors.black),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  alertPop({required BuildContext context,required String title, required String body, required String image}){
    showGeneralDialog(

      barrierLabel: "Label",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 500),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context);
        });
        return         AlertPup(title: title, body: body, image: image);
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
            position: Tween(
                begin: const Offset(0, -1), end: const Offset(0, -0.33))
                .animate(anim1),
            child: child);
      },
    );
  }
}
