import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CommonNetworkImage extends StatelessWidget {

  final String? imageUrl;
  final BoxFit? fit;

  const CommonNetworkImage(
      {Key? key,
      this.fit= BoxFit.fill ,
      required this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Stack(
      children:[
      CachedNetworkImage(
        fit: fit,
        imageUrl: imageUrl ?? '',
        placeholder: (context, url) =>
        const Center(child: SizedBox(width:20,height:20,child: CircularProgressIndicator(strokeWidth: 1,))),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      )
      ]);
  }
}
