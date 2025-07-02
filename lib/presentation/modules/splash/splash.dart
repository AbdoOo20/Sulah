import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sulah/core/routing/route.dart';
import 'package:sulah/injection.dart';
import 'package:sulah/presentation/component/component.dart';
import '../../../core/resources/app_assets.dart';
import '../../../core/resources/app_colors.dart';
import '../../../data/repository/SaveUserData.dart';
import '../auth/Intro/intro_screen.dart';
import '../auth/login/login.dart';
import '../layout/ButtonNavBar.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SaveUserData saveUserData = getIt();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (saveUserData.isShowIntro()) {
        if (saveUserData.getUserData()?.data?.id != null) {
          if (saveUserData.isSelectLocation()) {
            // Provider.of<AuthViewModel>(context,listen: false).updateFCMToken();
            pushAndRemoveUntil(const CustomBottomNavigationBar(0));
          } else {
            // Provider.of<AuthViewModel>(context,listen: false).updateFCMToken();
            pushAndRemoveUntil(const CustomBottomNavigationBar(0));
            // pushAndRemoveUntil(MapScreen());
          }
        } else {
          pushAndRemoveUntil(const Login());
        }
      } else {
        pushAndRemoveUntil(const IntroScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          Assets.splash,
        ),
      ),
    );
  }
}
