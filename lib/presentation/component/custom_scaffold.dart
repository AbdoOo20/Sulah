import 'package:flutter/material.dart';

import '../../../core/resources/values_manager.dart';
import 'status_bar.dart';

class CustomScaffold extends StatelessWidget {
  final String? _image;
  final Widget? _body;
  final bool _extendBodyBehindAppBar;
  final Widget?  _bottomNavigationBar;
  final PreferredSizeWidget? _appBar;

  const CustomScaffold({
    super.key,
    String? image,
     bool extendBodyBehindAppBar = false, Widget? body, PreferredSizeWidget? appBar,Widget? bottomNavigationBar,
  })  : _image = image,_appBar = appBar,_extendBodyBehindAppBar = extendBodyBehindAppBar, _body = body, _bottomNavigationBar = bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return StatusBar(
      color: Colors.white,
      isDark: true,
      child: Scaffold(
        extendBodyBehindAppBar: _extendBodyBehindAppBar,
        extendBody: _extendBodyBehindAppBar,
        bottomNavigationBar: _bottomNavigationBar,
        appBar: _appBar,
        body: SafeArea(
          top: !_extendBodyBehindAppBar,
          child: Container(
            height: deviceHeight,
            width: deviceWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              image: _image!=null ?DecorationImage(image: AssetImage(_image!), fit: BoxFit.cover):null,
            ),
            child: _body,
          ),
        ),
      ),
    );
  }
}
