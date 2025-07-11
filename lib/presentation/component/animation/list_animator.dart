import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import '../../../../core/resources/values_manager.dart';


class ListAnimator extends StatefulWidget {
  final List<Widget>? children;
  final int? duration;
  final double? verticalOffset;
  final ScrollPhysics? physics;
  final Axis scrollDirection;

  const ListAnimator({
    Key? key,
    this.children,
    this.duration,
    this.scrollDirection = Axis.vertical,

    this.verticalOffset,
    this.physics,
  }) : super(key: key);

  @override
  _ListAnimatorState createState() => _ListAnimatorState();
}

class _ListAnimatorState extends State<ListAnimator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:deviceHeight,
      child: AnimationConfiguration.synchronized(
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: ListView.separated(
            scrollDirection: widget.scrollDirection,
            itemCount: widget.children!.length,
            physics: widget.physics,
            itemBuilder: (_, index) {
              return AnimationConfiguration.staggeredList(
                position: index,

                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(

                    child: widget.children![index],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return widget.scrollDirection == Axis.vertical
                  ?  SizedBox(height: kFormPaddingVertical.h,)
                  :  SizedBox(width: kFormPaddingHorizontal.w,);
            },
          ),
        ),
      ),
    );
  }
}
