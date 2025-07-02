import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';

import '../../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../../core/resources/resources.dart';

class InerDetailsCared extends StatelessWidget {
  const InerDetailsCared({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105.w,
      height: 34.h,
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          color: color,
          border: const BorderDirectional(
            start: BorderSide(width: 1, color: Color(0xFFF2F2F2)),
            top: BorderSide(color: Color(0xFFF2F2F2)),
            end: BorderSide(color: Color(0xFFF2F2F2)),
            bottom: BorderSide(color: Color(0xFFF2F2F2)),
          )),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            textAlign: TextAlign.right,
            style: TextStyles()
                .getRegularStyle(
                  fontSize: 12.sp,
                )
                .customColor(AppColors.black),
          ),
        ],
      ),
    );
  }
}
