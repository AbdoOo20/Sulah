import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/core/resources/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class CustomPinCodeTextField extends StatelessWidget {
  final TextEditingController _controller;

  const CustomPinCodeTextField({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: PinCodeTextField(
          appContext: context,
          controller: _controller,
          textGradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryColor,
              AppColors.primaryColor,
            ],
          ),
          keyboardType: TextInputType.number,
          length: 5,
          cursorColor: Theme.of(context).primaryColor,
          animationType: AnimationType.scale,
          pinTheme: PinTheme(
            activeFillColor: AppColors.redLight,
            selectedFillColor: AppColors.redLight,
            inactiveFillColor: AppColors.redLight,
            inactiveColor: AppColors.primaryColor,
            activeColor: AppColors.primaryColor,
            selectedColor: Theme.of(context).hintColor,
          ),
          animationDuration: const Duration(milliseconds: 300),
          onCompleted: (submitedCode) {
            if (kDebugMode) {
              print("Completed");
            }
          },
          onChanged: (value) {
            if (kDebugMode) {
              print(value);
            }
          },
        ),
      ),
    );
  }
}
