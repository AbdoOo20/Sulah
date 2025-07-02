import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/presentation/component/animation/list_animator.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../component/component.dart';
import '../../../../../../../component/svg_icon.dart';
import '../productsViewModel.dart';
class StoreRateSheet extends StatefulWidget {
  const StoreRateSheet({super.key, required this.storeId});
final String storeId;
  @override
  _StoreRateSheetState createState() => _StoreRateSheetState();
}

class _StoreRateSheetState extends State<StoreRateSheet> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsViewModel>(
        builder: (context, data, child) => Column(
          mainAxisSize: MainAxisSize.min,
          // primary: falselse,
          // physics: const NeverScrollableScrollPhysics(),
          // shrinkWrap: true,
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
                // primary: false,
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.carsModel?.data?.length??0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Container(
                      height: 50,
                      color: Colors.transparent,
                      child: RadioListTile(
                        activeColor: AppColors.primaryColor,
                        title: Text(data.carsModel?.data?[index].title??'',
                          style: TextStyles().getTitleStyle().customColor(AppColors.black),
                        ),
                        value: data.carsModel?.data?[index],
                        groupValue:data.carModel ,
                        onChanged: (value) {
                          data.carModel=value;
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

