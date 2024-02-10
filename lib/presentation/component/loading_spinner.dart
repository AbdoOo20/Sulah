import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khedmaty/core/extensions/num_extensions.dart';

import 'base_platform_widget.dart';

class LoadingSpinner extends BasePlatformWidget<Center, Center> {
  final Color? color;
  final double? size;
  const LoadingSpinner({Key? key,
    this.color,
    this.size,
  }) : super(key: key);
  @override
  Center createCupertinoWidget(BuildContext context) {
    return Center(child: CupertinoActivityIndicator(radius: 24.r));
  }

  @override
  Center createMaterialWidget(BuildContext context) {
    return Center(
      child: SizedBox(
        height: (size??24).r,
        width: (size??24).r,
        child:  CircularProgressIndicator(strokeWidth: 3.w,color: color,),
      ),
    );
  }


}
