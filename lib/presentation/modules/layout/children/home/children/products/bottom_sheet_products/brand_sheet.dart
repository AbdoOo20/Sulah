import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/presentation/component/animation/list_animator.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../core/resources/locale_keys.g.dart';
import '../../../../../../../../core/resources/values_manager.dart';
import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/app_assets.dart';
import '../../../../../../../../core/resources/app_colors.dart';
import '../../../../../../../component/animation/list_animator_data.dart';
import '../../../../../../../component/svg_icon.dart';
import '../productsViewModel.dart';
class BrandSheet extends StatefulWidget {
  const BrandSheet({super.key});

  @override
  _BrandSheetState createState() => _BrandSheetState();
}

class _BrandSheetState extends State<BrandSheet> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsViewModel>(
        builder: (context, data, child) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 1,
              child: SizedBox(
                height: 60.h,
                child: Padding(
                  padding:  const EdgeInsets.all(kScreenPaddingNormal),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tr(LocaleKeys.section),
                        style: TextStyles().getTitleStyle().customColor(AppColors.black),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: ()=>Navigator.pop(context),
                        child:const SVGIcon(Assets.closePup),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: ListAnimatorData(
                shrinkWrap: true,
                itemCount: data.brandsModel?.data?.length??0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Container(
                      height: 50,
                      color: Colors.transparent,
                      child: RadioListTile(
                        activeColor: AppColors.primaryColor,
                        title: Text(data.brandsModel?.data?[index].title??'',
                          style: TextStyles().getTitleStyle().customColor(AppColors.black),
                        ),
                        value: data.brandsModel?.data?[index],
                        groupValue:data.brandModel ,
                        onChanged: (value) {
                          data.brandModel=value;
                          data.notify();
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  );

                },
              ),
            ),
          ],
        ));

  }
}

