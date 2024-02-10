import 'dart:io';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../core/logger.dart';
import '../../../../../../core/res/text_styles.dart';
import '../../../../../../core/resources/resources.dart';





class WebViewScreen extends StatefulWidget {
  final String _url;
  final String _title;

  const WebViewScreen({
    Key? key,
    String url = '',
    String title = '',
  })  : _url = url,
        _title = title,
        super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final _tag = 'WebViewScreen';
  late WebView webView;

  @override
  void initState() {
    webView = const WebView();

    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.semeBlack,
        backgroundColor: AppColors.white,
        title: Text(
          widget._title,
          style: TextStyles().getTitleStyle(fontSize: 16.sp),
        ),
      ),
      body: WebView(
        debuggingEnabled: true,
        onWebViewCreated: (v) {
          return;
        },
        initialUrl: widget._url,
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
        onPageStarted: (String url) => log(_tag, 'onPageStarted $url'),
        onPageFinished: (String url) {
          log(_tag, 'onPageFinished $url');
          // if (url.contains('endPayment?status=true')) {NavigationService.pushNamedAndRemoveUntil(Routes.layoutScreen,arguments: {"currentPage": 1});}
          // else if (url.contains('endOrderPayment?status=false')) {
          //   NavigationService.pushNamedAndRemoveUntil(Routes.layoutScreen,arguments: {"currentPage": 1});
          // }
        },
        navigationDelegate: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
