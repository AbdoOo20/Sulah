import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';
import '../../../../../../../../core/res/text_styles.dart';
import '../../../../../../../../core/resources/locale_keys.g.dart';
import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../component/component.dart';
import '../../../../../../../component/svg_icon.dart';
import '../productsViewModel.dart';

class ManufactureYearSheet extends StatefulWidget {
  const ManufactureYearSheet({super.key});

  @override
  _ManufactureYearSheetState createState() => _ManufactureYearSheetState();
}

class _ManufactureYearSheetState extends State<ManufactureYearSheet> {
  final int currentYear = DateTime.now().year;
  final int startYear = 1920;
  List<int> years = [];
  List<int> year(){
    for (int year = currentYear; year >= startYear; year--) {
      years.add(year);
    }
    return years;
  }

  @override
  void initState() {
    super.initState();
    year();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsViewModel>(
        builder: (context, data, child) =>  Column(
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
            itemCount: years.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Container(
                  height: 50,
                  color: Colors.transparent,
                  child: RadioListTile(
                    activeColor: AppColors.primaryColor,
                    title: Text(years[index].toString(),
                      style: TextStyles().getTitleStyle().customColor(AppColors.black),
                    ),
                    value: years[index],
                    groupValue:data.year ,
                    onChanged: (value) {
                      data.year=value;
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

