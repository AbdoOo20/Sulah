import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sulah/core/extensions/num_extensions.dart';

import '../../../../core/resources/values_manager.dart';
import '../component.dart';

class GridAnimatorData extends StatefulWidget {
  final int? itemCount;
  final int? duration;
  final int crossAxisCount;
  final double height;
  final double width;
  final double? verticalOffset;
  final ScrollPhysics? physics;
  final bool primary;
  final bool shrinkWrap;
  final bool isAnimated;
  final Widget? loadingWidget;
  final int? simmerItemCount;
  final Widget? noDataWidget;
  final Widget? separatorWidget;
  final bool isReverse;
  final Axis scrollDirection;
  final IndexedWidgetBuilder itemBuilder;
  final EdgeInsetsGeometry? padding;

  //pagination
  final Function? onNextCall;
  final int? totalPages;
  final int? currentPage;
  final bool? isNextPageLoading;

  const GridAnimatorData({
    Key? key,
    this.itemCount,
    this.duration,
    this.isAnimated = true,
    this.scrollDirection = Axis.vertical,
    this.primary = false,
    this.shrinkWrap = true,
    this.isReverse = false,
    required this.itemBuilder,
    this.noDataWidget,
    this.separatorWidget,
    this.loadingWidget,
    this.verticalOffset,
    this.height=127,
    this.width=172,
    this.crossAxisCount =2,
    this.padding,
    this.physics,
    this.simmerItemCount,
    this.isNextPageLoading,
    this.onNextCall,
    this.currentPage,
    this.totalPages,
  }) : super(key: key);

  @override
  _GridAnimatorDataState createState() => _GridAnimatorDataState();
}

class _GridAnimatorDataState extends State<GridAnimatorData> {


  @override
  Widget build(BuildContext context) {
    if (widget.itemCount == null) {
      return widget.loadingWidget != null
          ? _buildSimmerList()
          : const Center(child: LoadingSpinner());
    } else if (widget.itemCount == 0) {
      return widget.noDataWidget ?? const SizedBox();
    } else {
      return SizedBox(
        child: AnimationConfiguration.synchronized(
          child: SlideAnimation(
              verticalOffset: widget.scrollDirection == Axis.vertical && widget.isAnimated ? 50.0 : null,
              horizontalOffset: widget.scrollDirection == Axis.horizontal && widget.isAnimated ? 50.0 : null,
              child: AnimationLimiter(
                  child: GridView.builder(
                    // gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                    //   maxCrossAxisExtent: widget.width.w,
                    //   mainAxisSpacing:kFormPaddingVertical  ,
                    //   childAspectRatio: 10,
                    //   crossAxisSpacing: kFormPaddingHorizontal,
                    //   mainAxisExtent: widget.height.h,
                    // ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (1 / 1),
                      crossAxisCount: widget.crossAxisCount,
                      mainAxisSpacing: kFormPaddingHorizontal,
                      crossAxisSpacing: kFormPaddingVertical,
                      mainAxisExtent: widget.height.h,
                    ),
                itemCount: widget.itemCount ?? 0,
                itemBuilder: widget.itemBuilder,
                scrollDirection: widget.scrollDirection,
                primary: widget.primary,
                physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
                shrinkWrap: widget.shrinkWrap,
                padding: widget.padding,
                reverse: widget.isReverse,
                // separatorBuilder: (context, index) {
                //   return widget.separatorWidget ??
                //       (widget.scrollDirection == Axis.vertical
                //           ?const VerticalSpace( kFormPaddingVertical)
                //           :const HorizontalSpace( kFormPaddingHorizontal)
                //       );
                // },
              ))),
        ),
      );
    }
  }

  _buildSimmerList() {
    return ListView.separated(
      itemCount: widget.simmerItemCount ?? 1,
      itemBuilder: (context, index) {
        return widget.loadingWidget ?? Container();
      },
      scrollDirection: widget.scrollDirection,
      primary: widget.primary,
      shrinkWrap: widget.shrinkWrap,
      padding: widget.padding,
      reverse: widget.isReverse,
      separatorBuilder: (context, index) {
        return widget.separatorWidget ??
            (widget.scrollDirection == Axis.vertical
                ? const VerticalSpace( kFormPaddingVertical)
                :const HorizontalSpace( kFormPaddingHorizontal)
            );
      },
    );
  }
}
