import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/res/text_styles.dart';

class TextClickWidget extends StatelessWidget {
  final String? text ;
  final String? subText ;
  final Color? textColor ;
  final GestureTapCallback? onTap;
  const TextClickWidget({
    this.textColor,
    this.text,
    this.subText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${text ?? ''} ' ,
            style: TextStyles().getRegularStyle().blackStyle().copyWith(
                height: 1.4,
            ),
          ),
          TextSpan(
            text: subText ?? '',
            style:TextStyles().getRegularStyle().copyWith( height: 1.4 ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}

