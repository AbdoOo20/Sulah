import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';

import '../../../core/resources/locale_keys.g.dart';
import '../../data/model/response/base/error_response.dart';


class ErrorLayout extends StatelessWidget {
  final String? _error;
  final VoidCallback? _onRetry;

  const ErrorLayout({Key? key, String? error, VoidCallback? onRetry})
      : _error = error,
        _onRetry = onRetry, super(key: key);


  @override
  Widget build(BuildContext context) {
      return ErrorView(message: _error ?? 'Error',onRetry: _onRetry);

  }
}

class ErrorView extends StatelessWidget {
  final String? _message;
  final VoidCallback? _onRetry;

  ErrorView ({Key? key, String? message, VoidCallback? onRetry})
      : _message = message,
        _onRetry = onRetry, super(key: key);

  final retryShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: const BorderSide(color: Colors.grey));

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_message ?? ''),
           SizedBox(height: 20.h,),
          if(_onRetry != null)
          TextButton(
            child: Text(
              tr(LocaleKeys.retry),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            onPressed: _onRetry,
            style: TextButton.styleFrom(shape: retryShape,),

          ),
        ],
      ),
    ));
  }
}
