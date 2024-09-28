import 'dart:math';

import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';

class CenterNob extends StatelessWidget {
  const CenterNob({super.key});

  @override
  Widget build(BuildContext context) {
    const width = AppSize.s18;
    const height = AppSize.s18;
    return Transform(
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0)
        ..rotateZ(2 * pi * (1 / 60)),
      child: Container(
        width: AppSize.s18,
        height: AppSize.s18,
        decoration:
        BoxDecoration(
            color: Theme.of(context).colorScheme.onSecondary,
            shape: BoxShape.circle),
      ),
    );
  }
}