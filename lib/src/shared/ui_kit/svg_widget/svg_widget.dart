import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGWidget extends StatelessWidget {
  final String svgPath;
  final Color? color;
  final double size;
  final BoxFit? boxFit;

  const SVGWidget({
    super.key,
    required this.svgPath,
    this.color,
    this.size = 100.0,
    this.boxFit,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      colorFilter: (color != null) ? ColorFilter.mode(color ?? Theme.of(context).colorScheme.primary, BlendMode.srcIn) : null,
      width: size,
      height: size,
      fit: boxFit ?? BoxFit.contain,
    );
  }
}