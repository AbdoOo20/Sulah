import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';

import '../../../core/res/text_styles.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/locale_keys.g.dart';
import '../../../core/resources/values_manager.dart';
import 'component.dart';



class NoDataScreen extends StatelessWidget {
  final String  title;
  final String? desc;
  final String image;
  const NoDataScreen({Key? key, this.title = LocaleKeys.noResultFound,  this.desc ,  this.image = Assets.gifEmptyList}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.all(kFormPaddingHorizontal.r),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            image,
            width:200.w,
            height: 200.w,
          ),


          const SizedBox(height: kFormPaddingHorizontal),

          Text(
            tr(title),
            style: TextStyles().getTitleStyle(),
            textAlign: TextAlign.center,
          ),
           VerticalSpace(kScreenPaddingNormal.h),


          Text(
            desc??'',
            style: TextStyles().getRegularStyle().hintStyle(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: kScreenPaddingNormal),

        ]),
      ),
    );
  }
}
