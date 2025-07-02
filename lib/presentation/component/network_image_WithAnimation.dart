
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';
import '../../core/resources/app_assets.dart';
import 'svg_icon.dart';

class NetworkImageWithAnimation extends StatefulWidget {
  final String? imageUrl;
  final BoxFit? boxFit;
  final double? width, height;

  const NetworkImageWithAnimation({Key? key, this.imageUrl, this.boxFit = BoxFit.cover, this.width = double.infinity, this.height = double.infinity})
      : super(key: key);

  @override
  State<NetworkImageWithAnimation> createState() => ImageLoaderState();
}

class ImageLoaderState extends State<NetworkImageWithAnimation> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? animation;

  initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true);
    animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  Widget loadDefault({String? url, double height: double.infinity, double width: double.infinity}) {
    return CachedNetworkImage(
        imageUrl: widget.imageUrl ?? "",
        height: height,
        width: width,
        fit: widget.boxFit ?? BoxFit.cover,
        placeholder: (context, url) => Container(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(6.sp),
              child: FadeTransition(
                opacity: animation!,
                child: const SVGIcon(Assets.logo,),
              ),
            ),
        errorWidget: (context, url, error) => Container(
              padding: EdgeInsets.all(4.sp),
              color: Theme.of(context).primaryColor,
              child: Icon(Icons.error_outline)
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: loadDefault(),
    );
  }
}
