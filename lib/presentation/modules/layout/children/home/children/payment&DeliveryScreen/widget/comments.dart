import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../component/inputs/custom_text_field_area.dart';
import '../../shoppingCard/shopping_cared_view_model.dart';



class Comments extends StatelessWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r), color: AppColors.white),
      child: Column(
        children: [
          CustomTextFieldArea(
            controller: Provider.of<ShoppingCaredViewModel>(context, listen: false).noteController,
            iconSVG: Assets.comments,
            noBorder: true,
            background: AppColors.white,
            hint: LocaleKeys.comments.tr(),
          ),
          Container(color: AppColors.grayLight,height: .5.h,)
        ],
      ),
    );
  }
}
