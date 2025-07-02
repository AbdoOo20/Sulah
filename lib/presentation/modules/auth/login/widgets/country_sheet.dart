import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:provider/provider.dart';
import '../../../../../core/res/text_styles.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../component/component.dart';
import '../../auth_view_model.dart';


class CountrySheet extends StatefulWidget {
  @override
  State<CountrySheet> createState() => _CountrySheetState();

  const CountrySheet({super.key});
}

class _CountrySheetState extends State<CountrySheet> {
  final tag = 'ChangeCountrySheet';
  late String code= '+966' ;
  void _onCountrySelected() {
    Navigator.pop(context);
    Provider.of<AuthViewModel>(context, listen: false).phoneCodeCountry=code;
  }
  final supportedCountry = <String>[
    '+966',
    '+20',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(bottom: 16.h, top: 24.h,left: 24.w,right: 24.w),
      decoration:  BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(36.r)),
          color: AppColors.white),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr(LocaleKeys.country),
                  style: TextStyles().getTitleStyle(fontSize: 18.sp).customColor(AppColors.black),
                ),
                GestureDetector(
                  onTap: ()=> Navigator.pop(context),
                  child:  SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: CircleAvatar(
                      backgroundColor: AppColors.black,
                      child: Center(child: Icon(Icons.close,size: 16.r,color: AppColors.white,)),
                    ),
                  ),
                ),
              ],
            ),

            ScreenStateLayout(
              builder: (context) {
                return buildBody(context,
                  items: supportedCountry, selectedItem: code);
              },
            ),
            VerticalSpace(kScreenPaddingNormal.h),
            CustomButton(
              color: AppColors.primaryColor,
              onTap: () {
                _onCountrySelected();
              },
              title: LocaleKeys.confirm.tr(),
              width: double.infinity,
            )
          ]),
    );
  }

  Widget buildBody(BuildContext context, {required List<String> items, required String selectedItem}) {
    return Container(
      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height / 2),
      child: ListView(
         // itemCount: 2,
          shrinkWrap: true,
      //       itemBuilder: (BuildContext context, int index) {
      //   buildSingleChoiceItem(context, items: items,  )
      // },
           children: items.map((e) => buildSingleChoiceItem(context, selectedItem,e)).toList(),
      ),
    );
  }

  Widget buildSingleChoiceItem(BuildContext context, String selectedItem ,String items) {
    return RadioListTile<String>(
      contentPadding: EdgeInsets.zero,
      activeColor: AppColors.primaryColor,
      groupValue: selectedItem,
      title: Text(items=='+20'?LocaleKeys.egypt.tr():LocaleKeys.saudiArabia.tr(),style: const TextStyle().bodyStyle().customColor(AppColors.black),),
      value:items,
      onChanged: (value) {
        if (value != null) {
          setState(() {
            code = value;
          });
        }
      },
    );
  }
}

