import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';

import '../../../../../../../../core/resources/app_colors.dart';


class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double? width;
  final double? height;
  final double? widthCircle;
  final double? heightCircle;

  final Color? activeColor;
  final Color? inactiveColor;
  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.width,
    this.height,
    this.widthCircle,
    this.heightCircle,
    this.activeColor,
    this.inactiveColor,
  }) : super(key: key);

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController!.isCompleted) {
              _animationController!.reverse();
            } else {
              _animationController!.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: widget.width ?? 48.w,
            height: widget.height ?? 24.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: _circleAnimation!.value == Alignment.centerLeft
                  ? widget.inactiveColor ?? AppColors.main10
                  : widget.activeColor ?? AppColors.semeBlack,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child: Container(
                alignment: widget.value
                    ? ((Directionality.of(context) == TextDirection.rtl)
                        ? Alignment.centerRight
                        : Alignment.centerLeft)
                    : ((Directionality.of(context) == TextDirection.rtl)
                        ? Alignment.centerLeft
                        : Alignment.centerRight),
                child: CustomSwitchCircle(
                    heightCircle: widget.heightCircle,
                    widthCircle: widget.widthCircle),
              ),
              // child: Row(
              //   children: widget.value
              //       ? ((Directionality.of(context) == TextDirection.rtl)
              //           ? [
              //               SizedBox(
              //                 child: widget.widget,
              //               ),
              //               customSwitchCircle(
              //                   heightCircle: widget.heightCircle,
              //                   widthCircle: widget.widthCircle),
              //             ]
              //           : [
              //               customSwitchCircle(
              //                   heightCircle: widget.heightCircle,
              //                   widthCircle: widget.widthCircle),
              //               SizedBox(
              //                 child: widget.widget,
              //               ),
              //             ])
              //       : ((Directionality.of(context) == TextDirection.rtl)
              //           ? [
              //               customSwitchCircle(
              //                   heightCircle: widget.heightCircle,
              //                   widthCircle: widget.widthCircle),
              //               SizedBox(
              //                 child: widget.widget,
              //               ),
              //             ]
              //           : [
              //               SizedBox(
              //                 child: widget.widget,
              //               ),
              //               customSwitchCircle(
              //                   heightCircle: widget.heightCircle,
              //                   widthCircle: widget.widthCircle),
              //             ]),
              //   //  [
              //   //   SizedBox(
              //   //     child: widget.widget,
              //   //   ),
              //   //   customSwitchCircle(
              //   //       heightCircle: widget.heightCircle,
              //   //       widthCircle: widget.widthCircle),
              //   // ],
              // ),
            ),
          ),
        );
      },
    );
  }
}

class CustomSwitchCircle extends StatelessWidget {
  const CustomSwitchCircle({
    super.key,
    this.widthCircle,
    this.heightCircle,
  });

  final double? widthCircle;
  final double? heightCircle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthCircle ?? 16.w,
      height: heightCircle ?? 16.h,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
    );
  }
}

// //  Text(
//                         'off',
//                         style: TextStyles()
//                             .getRegularStyle(
//                               fontSize: 12.sp,
//                             )
//                             .copyWith(color: AppColors.wiite),
//                       ),