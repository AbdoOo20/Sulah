import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';

import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/locale_keys.g.dart';
import '../../../core/resources/values_manager.dart';
import 'component.dart';



class SmallNoDataScreen extends StatelessWidget {
  final String  title;
  final String? desc;
  final String image;
  const SmallNoDataScreen({Key? key, this.title = LocaleKeys.noResultFound,  this.desc ,  this.image = Assets.gifEmptyList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.all(kFormPaddingHorizontal.r),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            image,
            width:50.w,
            height: 50.w,
          ),


          //const SizedBox(height: kFormPaddingHorizontal),

          Text(
            tr(title),
            style: TextStyles().getTitleStyle(fontSize: 8),
            textAlign: TextAlign.center,
          ),
          //VerticalSpace(kScreenPaddingNormal.h),

          //
          // Text(
          //   desc??'',
          //   style: TextStyles().getRegularStyle().hintStyle(),
          //   textAlign: TextAlign.center,
          // ),
          // const SizedBox(height: kScreenPaddingNormal),

        ]),
      ),
    );
  }
}
