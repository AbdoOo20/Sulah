import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../core/res/text_styles.dart';

class DialogLoading extends StatelessWidget {
  final _tag = "DialogLoading";

  final String _message;

  const DialogLoading({Key? key,
    required String message,
  }) : _message = message, super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 8),
      child: Column(
        children: [
          SpinKitPulse(
            color: Theme.of(context).primaryColor,
            size: 70,
          ),
          const SizedBox(height: 16),
          Text(_message,
              style: TextStyles().getRegularStyle()
          ),
        ],
      ),
    );
  }


}
