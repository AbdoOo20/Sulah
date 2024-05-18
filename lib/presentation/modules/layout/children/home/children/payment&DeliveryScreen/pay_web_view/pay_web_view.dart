import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../../../../core/resources/resources.dart';
import '../../../../../../../../core/routing/route.dart';
import '../../../../../../../../core/utils/showToast.dart';
import '../../../../../../../component/component.dart';
import '../../../../../../../dialog/dialog_Done.dart';
import '../../../../../../auth/auth_view_model.dart';
import '../../../../../ButtonNavBar.dart';


class PayWebViewScreen extends StatefulWidget {
  const PayWebViewScreen({Key? key, required this.id, required this.link}) : super(key: key);
final int id;
final String link;
  @override
  State<PayWebViewScreen> createState() => _PayWebViewScreenState();
}

class _PayWebViewScreenState extends State<PayWebViewScreen> {
  String filedUrl ='https://khedmaty-sa.com/api/user/endPayment?status=false';
  String successUrl ='https://khedmaty-sa.com/api/user/endPayment?status=true';
  WebViewController? _webViewController;
  String _currentUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        color: Colors.white,
        title: "completePaymentInformation".tr(),
        onBackPress: (){
          pushAndRemoveUntil(const CustomBottomNavigationBar(0));
        },
      ),
      body: WebView(
        initialUrl: "${widget.link}${widget.id}",
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: (String url) {
          setState(() {
            _currentUrl = url;
          });
        },
        onPageFinished: (String url) {
          setState(() {
            _currentUrl = url;
            // if (_currentUrl == successUrl){
            //   Timer(const Duration(seconds: 2), () {
            //     showDialog<String>(context: context, builder: (BuildContext context) => DialogDone(title: LocaleKeys.requestSentSuccessfully.tr(),));
            //   });
            // }else if(_currentUrl == filedUrl){
            //   ToastUtils.showToast("paymentFailed".tr());
            //   Timer(const Duration(seconds: 2), () {
            //     pushAndRemoveUntil(const CustomBottomNavigationBar(0));
            //   });
            // }
          });
        },
        onWebViewCreated: (WebViewController webViewController) {
          Map<String, String> headers = {"Authorization": "Bearer ${Provider.of<AuthViewModel>(context, listen: false).saveUserData.getUserToken()}"};
          webViewController.loadUrl('', headers: headers);
          _webViewController = webViewController;
        },
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Text('Current URL: $_currentUrl'),
      //   ),
      // ),
    );
  }
}