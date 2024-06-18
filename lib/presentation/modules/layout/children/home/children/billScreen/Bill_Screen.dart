import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:khedmaty/core/logger.dart';
import 'package:khedmaty/core/resources/locale_keys.g.dart';
import 'package:khedmaty/presentation/component/component.dart';
import 'package:provider/provider.dart';
import '../../../../../../../core/resources/app_colors.dart';
import '../../../../../../../data/datasource/locale/database_provider.dart';
import '../../../../../../../data/repository/SaveUserData.dart';
import '../../../../../../../injection.dart';
import '../shoppingCard/shopping_cared_view_model.dart';
import 'widget/billCard.dart';
import 'widget/paymentAndLocationCard.dart';
import 'dart:developer' as dev;

class BillScreen extends StatefulWidget {
  BillScreen({Key? key, required this.isDelivery}) : super(key: key);
  SaveUserData saveUserData = getIt();
  final bool isDelivery;

  @override
  State<BillScreen> createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  bool discount = false;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ShoppingCaredViewModel, CartProvider>(
        builder: (context, shopping, cart, child) {
      String typePay = shopping.paymentType == 'cash'
          ? LocaleKeys.cash.tr()
          : shopping.paymentType == 'mada'
              ? LocaleKeys.madaPay.tr()
              : shopping.paymentType == 'taby'
                  ? LocaleKeys.tabyPay.tr()
                  : '';
      return CustomScaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.theBill.tr(),
          color: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: ListAnimator(
                  children: [
                    PaymentAndLocationCard(
                      deliveryAddressTitle: shopping.saveUserData.getDistance(),
                      paymentMethodTitle: typePay,
                      commentsTitle: shopping.noteController?.text,
                    ),
                    BillCard(
                      totalPrice: cart.total,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 16.h, bottom: 16.h, left: 16.w, right: 16.w),
              child: CustomButton(
                loading: shopping.isLoading,
                onTap: () {
                  Provider.of<ShoppingCaredViewModel>(context, listen: false)
                      .calculateOrderCost(
                          context: context, isDelivery: widget.isDelivery);
                },
                title: LocaleKeys.sendOrder.tr(),
                textColor: AppColors.white,
                color: AppColors.primaryColor,
              ),
            )
          ],
        ),
      );
    });
  }
}
