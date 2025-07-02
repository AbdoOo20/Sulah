import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import 'package:sulah/presentation/component/component.dart';
import 'package:provider/provider.dart';

import '../homeViewModel.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, images, child) {
      return images.sliderModel?.data?.isNotEmpty??false
          ? CarouselSlider.builder(
              itemCount: images.sliderModel?.data?.length,
              itemBuilder: (_, index, realIndex) {
                final urlImage =
                    images.sliderModel?.data?[index].image;
                return Container(
                  width: double.infinity,
                  height: 171.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  padding:  EdgeInsets.symmetric(horizontal: 4.w),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0.r),
                    child: CommonNetworkImage(
                     imageUrl:  urlImage ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 171.h,
                autoPlay: true,
                aspectRatio: 2,
                pageSnapping: false,
                initialPage: 0,
                //autoPlayCurve: Curves.bounceOut,
                autoPlayInterval: const Duration(seconds: 3),
                //autoPlayAnimationDuration: Duration(seconds: 1),
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                viewportFraction: 0.9,
              ))
          : const SizedBox();
    });
  }
}
