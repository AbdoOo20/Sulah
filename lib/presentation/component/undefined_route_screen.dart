import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/font_manager.dart';
import '../../../core/resources/locale_keys.g.dart';
import 'component.dart';


class UndefinedRouteScreen extends StatelessWidget {
  const UndefinedRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StatusBar(
      child: Scaffold(
        body: Center(
          child: CustomText(tr(LocaleKeys.noRouteFound), fontSize: FontSize.s20, fontWeight: FontWeightManager.bold),
        ),
      ),
    );
  }
}
