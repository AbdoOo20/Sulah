import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/data/repository/SaveUserData.dart';
import 'package:sulah/injection.dart';
import 'package:sulah/presentation/component/component.dart';
import 'package:sulah/presentation/modules/auth/login/login.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/res/text_styles.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/locale_keys.g.dart';
import '../../../../core/routing/route.dart';
import '../../../component/svg_icon.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  SaveUserData saveUserData = getIt();
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final List<String> _imagePaths = [
    Assets.intro1,
    Assets.intro2,
    Assets.intro3,
  ];
  final List<String> _textTitlePaths = [
    "مرحباً بك في ايداع سيولة",
    "تصفح تشكيلتنا الواسعة",
    "شراء بسهولة وبثقة",
  ];
  final List<String> _textSubTitlePaths = [
    'تصفح متجرنا بسهولة ويسر للحصول علي اختيارات عديدة واجهزة مختلفة',
    'احصل علي اجهزة مبتكرة مع خدمات عصرية',
    'اجهزتك توصلك وين ماكنت'
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Column(
          children: [
            SizedBox(
              height: 70.h,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 16.w, right: 16.w, top: 8.w, bottom: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SVGIcon(
                      Assets.logo,
                      height: 90.h,
                      width: 70.w,
                    ),
                    CustomButton(
                        width: 70.w,
                        height: 38.h,
                        isRounded: false,
                        borderRadius: 20.r,
                        fontSize: 12.r,
                        borderColor: AppColors.grayLight,
                        color: AppColors.grayLight,
                        title: LocaleKeys.skip.tr(),
                        textColor: AppColors.black,
                        onTap: () {
                          saveUserData.saveIsShowIntro(true);
                          pushAndRemoveUntil(const Login());
                        }),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _imagePaths.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return AnimationConfiguration.synchronized(
                    child: SlideAnimation(
                      duration: const Duration(milliseconds: 1000),
                      child: AnimationLimiter(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Lottie.asset(
                            _imagePaths[_currentPage],
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.4,
                          ),
                          Column(
                            children: [
                              Text(
                                _textTitlePaths[_currentPage],
                                style: TextStyles()
                                    .getTitleStyle(fontSize: 20.sp)
                                    .customColor(AppColors.gray),
                                textAlign: TextAlign.center,
                              ),
                              Padding(
                                padding: EdgeInsets.all(16.r),
                                child: Text(
                                  _textSubTitlePaths[_currentPage],
                                  style: TextStyles()
                                      .getDescriptionStyle(fontSize: 14.sp)
                                      .customColor(AppColors.gray),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: AppColors.primaryColor,
                      dotHeight: 12,
                      dotWidth: 12,
                    ),
                  ),
                  Row(
                    children: [
                      _currentPage == 0
                          ? const SizedBox()
                          : InkWell(
                              onTap: () {
                                if (_currentPage > 0) {
                                  _pageController.previousPage(
                                      duration: const Duration(milliseconds: 500),
                                      curve: Curves.ease);
                                }
                              },
                              child: SizedBox(
                                height: 50.h,
                                width: 50.w,
                                child: SVGIcon(
                                  Assets.previousIntro,
                                  height: 50.h,
                                  width: 50.w,
                                ),
                              ),
                            ),
                      SizedBox(
                        width: 7.w,
                      ),
                      _currentPage == 2
                          ? CustomButton(
                              width: 70.w,
                              height: 50.h,
                              isRounded: false,
                              borderRadius: 25.r,
                              fontSize: 12.r,
                              borderColor: AppColors.grayLight,
                              color: AppColors.grayLight,
                              title: LocaleKeys.start.tr(),
                              textColor: AppColors.black,
                              onTap: () {
                                saveUserData.saveIsShowIntro(true);
                                pushAndRemoveUntil(const Login());
                              })
                          : InkWell(
                              onTap: () {
                                _pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: SizedBox(
                                height: 50.h,
                                width: 50.w,
                                child: SVGIcon(
                                  Assets.nextIntro,
                                  height: 50.h,
                                  width: 50.w,
                                ),
                              ),
                            ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
