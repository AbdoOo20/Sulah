import 'dart:io';

import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';

import '../../../../../core/resources/resources.dart';
import '../../../../component/svg_icon.dart';

class PickerPart extends StatelessWidget {
  const PickerPart({
    super.key,
    this.image,
  });

  final File? image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 124.r,
            height: 124.r,
            padding: EdgeInsets.all(4.r),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.73.w,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: AppColors.grayLight,
                ),
                borderRadius: BorderRadius.circular(62.5.r),
              ),
            ),
            child: Center(
              child: image == null
                  ? SVGIcon(
                      Assets.camera,
                      width: 100.w,
                      height: 100.h,
                    )
                  : ClipRRect(
                  borderRadius: BorderRadius.circular(62.5.r),
                      child: Image.file(
                        image!,
                        fit: BoxFit.cover,
                      )),
            ),
          ),
          Positioned(
            bottom: 4.h,
            right: 4.w,
            child: SVGIcon(
              Assets.add,
              width: 23.43.w,
              height: 23.43.h,
            ),
          ),
        ],
      ),
    );
  }
}
