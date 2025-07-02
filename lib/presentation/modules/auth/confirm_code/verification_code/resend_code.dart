import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/core/res/text_styles.dart';
import 'package:sulah/core/resources/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../../core/resources/locale_keys.g.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../auth_view_model.dart';

class ResendConfirmCode extends StatefulWidget {
  @override
  State <ResendConfirmCode> createState() => _ResendConfirmCodeState();

  const ResendConfirmCode({super.key, required this.phone});

  final String phone;
}

class _ResendConfirmCodeState extends State<ResendConfirmCode> {
  late Timer _timer;
  int _start = 60;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = Provider.of<AuthViewModel>(context, listen: true).loading;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kScreenPaddingLarge.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          if (_start == 0)
            SizedBox(
              child: !isLoading
                  ? InkWell(
                      onTap: () {
                        Provider.of<AuthViewModel>(context, listen: false).sendOTPFirebase(context, widget.phone);
                      },
                      child: Text(
                        tr(LocaleKeys.resendCodeAgain),
                        textAlign: TextAlign.center,
                        style: const TextStyle()
                            .regularStyle()
                            .bodyStyle()
                            .customColor(AppColors.primaryColor,),
                      ),
                    )
                  : SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: Padding(
                        padding: EdgeInsets.all(4.r),
                        child: const CircularProgressIndicator(
                          strokeWidth: 3,
                        ),
                      )),
            ),
          SizedBox(
            width: 8.w,
          ),
          if (_start != 0)
            Text(
              '00:${_start.toString()}',
              style: const TextStyle()
                  .regularStyle()
                  .bodyStyle()
                  .customColor(AppColors.black),
            ),
        ],
      ),
    );
  }
}
