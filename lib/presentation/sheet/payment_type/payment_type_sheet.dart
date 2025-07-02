import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import '../../../../core/logger.dart';
import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/locale_keys.g.dart';
import '../../../../core/resources/values_manager.dart';
import '../../component/component.dart';
import '../../component/svg_icon.dart';


enum PaymentType{mada,cash,applePay}

class PaymentMethodModel{
 final String _title;
 final String _image;
 final PaymentType _type;

 const PaymentMethodModel({
    required String title,
    required String image,
    required PaymentType type,
  })  : _title = title,
        _image = image,
        _type = type;

 PaymentType get type => _type;

  String get image => _image;

  String get title => _title;
}

class PaymentTypeSheet extends StatefulWidget {
  final int _requestId;


  @override
  State<PaymentTypeSheet> createState() => _PaymentTypeSheetState();

  const PaymentTypeSheet({super.key,
    required int requestId,
  }) : _requestId = requestId;
}

class _PaymentTypeSheetState extends State<PaymentTypeSheet> {
  final tag = 'PaymentTypeSheet';
  final List<PaymentMethodModel> _paymentMethods=[
    PaymentMethodModel(title: tr(LocaleKeys.mada), image: Assets.imagesMada, type: PaymentType.mada),
    PaymentMethodModel(title: tr(LocaleKeys.cash), image: Assets.imagesCash, type: PaymentType.cash),
    PaymentMethodModel(title: tr(LocaleKeys.applePay), image: Assets.imagesApplePay, type: PaymentType.applePay),
  ];
  late  PaymentMethodModel _selectedPaymentMethod = _paymentMethods[0];
  @override
  void initState() {
    super.initState();
  }

  void _onSubmitSelected() {
    log('onSubmitSelected', 'selected method is (${_selectedPaymentMethod._title})');
    Navigator.pop(context);
    // NavigationService.push(Routes.webViewScreen,arguments: {'url':Constants.getPaymentMethodLink(requestId: widget._requestId, type: _selectedPaymentMethod._type.name),'title':tr(LocaleKeys.pay)});
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.only(bottom: 32, top: 4),
      decoration:  BoxDecoration(
          borderRadius:const BorderRadius.vertical(top: Radius.circular(20)),
          color: Theme.of(context).scaffoldBackgroundColor),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding:  const EdgeInsets.all(kScreenPaddingNormal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr(LocaleKeys.selectPaymentType),
                    style: TextStyles().getTitleStyle(),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: ()=> Navigator.pop(context),
                    child:const SVGIcon(Assets.svgExitIcon),
                  ),
                ],
              ),
            ),

            const Divider(height: 8),
            ScreenStateLayout(
              builder: (context) => _buildBody(context,
                  items: _paymentMethods, selectedItem: _selectedPaymentMethod),
            ),
            const VerticalSpace(kScreenPaddingNormal),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kScreenPaddingNormal),
              child: CustomButton(title: tr(LocaleKeys.confirmAndEnd),onTap: () =>_onSubmitSelected()),
            )
          ]),
    );
  }

  Widget _buildBody(BuildContext context, {required List<PaymentMethodModel> items, required PaymentMethodModel selectedItem}) {
    return Container(
      // height: 88.r,
      padding: EdgeInsets.symmetric( horizontal: kFormPaddingAllSmall.w),
      // constraints: BoxConstraints(maxHeight: deviceHeight / 4),
      child: Row(
        children: [
          Expanded(child:  _buildSingleChoiceItem(context, selectedItem, items[0])),
          Expanded(child:  _buildSingleChoiceItem(context, selectedItem, items[1])),
          if(Platform.isIOS)
          Expanded(child:  _buildSingleChoiceItem(context, selectedItem, items[2])),

        ],
      ),
      // child: ListView(
      //     scrollDirection: Axis.horizontal,
      //     children: items.map((e) => _buildSingleChoiceItem(context, selectedItem, e)).toList()),
    );
  }

  Widget _buildSingleChoiceItem(BuildContext context, PaymentMethodModel selectedItem, PaymentMethodModel item) {
    bool isSelected = selectedItem.type == item.type;
    return  Container(
      margin: EdgeInsets.all(kFormPaddingAllSmall.r),
      // decoration:const  BoxDecoration().listStyle().borderStyle(color: isSelected?Theme.of(context).primaryColor: Theme.of(context).cardColor).customColor(isSelected?Theme.of(context).hoverColor: Theme.of(context).cardColor).shadow(),
      width: 88.r,
      height: 88.r,
      child: Material(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(kFormRadius),),
        child: InkWell(
          onTap: ()=>setState(() =>_selectedPaymentMethod = item),
          borderRadius: const BorderRadius.all(Radius.circular(kFormRadius),),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(item.image,width: 52.w,height: 32.h),
              Text(item.title,maxLines: 1,style: TextStyles().getTitleStyle(fontSize: 12).hintStyle().boldStyle().ellipsisStyle(),),
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> showPaymentTypeSheet(BuildContext context,{required int requestId}) async {
  return showMaterialModalBottomSheet(
    expand: false,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => SafeArea(child: PaymentTypeSheet(requestId:requestId)),
  );


}
