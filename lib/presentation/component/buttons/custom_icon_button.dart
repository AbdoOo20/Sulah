import 'package:flutter/material.dart';
import 'package:sulah/core/extensions/num_extensions.dart';

import '../../../../core/resources/font_manager.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final Color? color;
  final double size;

  const CustomIconButton({
    required this.icon,
    this.onPressed,
    this.color,
    this.size = FontSize.s24,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(

      onPressed: onPressed,
      color: color ?? Theme.of(context).primaryColor,
      iconSize: size.sp,
      icon: Icon(icon),
    );
  }
}
