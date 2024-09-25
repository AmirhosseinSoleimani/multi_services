import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({super.key, required this.onTap, this.child, this.iconData, this.size, this.iconColor, this.backgroundColor, this.borderRadius, this.width, this.height});
  final VoidCallback onTap;
  final Widget? child;
  final IconData? iconData;
  final double? size;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? borderRadius;
  final double? width;
  final double? height;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? AppSize.s80,
        height: height ?? AppSize.s32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? AppSize.s24)),
          color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
        ),
        child: Center(
          child: child ?? Icon(
              iconData,
              size: size ?? AppSize.s24,
              color: iconColor ?? Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
