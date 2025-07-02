import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../../core/resources/values_manager.dart';
import '../../../../../../../component/component.dart';
import '../../../../../../../component/svg_icon.dart';
import '../../../homeViewModel.dart';
import '../productsViewModel.dart';
class DepartmentSheet extends StatefulWidget {
  const DepartmentSheet({super.key});
  @override
  _DepartmentSheetState createState() => _DepartmentSheetState();
}
class _DepartmentSheetState extends State<DepartmentSheet> {
  Widget build(BuildContext context) {
    return Consumer2<ProductsViewModel,HomeViewModel>(
        builder: (context, product,home, child) => Column(
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
                itemCount: home.departmentsModel?.data?.length??0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Container(
                      height: 50,
                      color: Colors.transparent,
                      child: RadioListTile(
                        activeColor: AppColors.primaryColor,
                        title: Text(home.departmentsModel?.data?[index].title??'',
                          style: TextStyles().getTitleStyle().customColor(AppColors.black),
                        ),
                        value: home.departmentsModel?.data?[index],
                        groupValue:product.departments ,
                        onChanged: (value) {
                          product.departments=value;
                          product.notify();
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

