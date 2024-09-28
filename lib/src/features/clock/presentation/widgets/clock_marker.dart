import 'dart:math';
import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';

class ClockMarker extends StatelessWidget {
  const ClockMarker({super.key, required this.radius, required this.seconds});
  final double radius;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    final Color color = seconds % 5 == 0 ? Theme.of(context).colorScheme.onSurface : Theme.of(context).colorScheme.onSecondary;
    const width = AppSize.s4;
    const height = AppSize.s12;
    return Transform(
        transform: Matrix4.identity()
          ..translate(-width / 2, -height / 2, 0)
          ..rotateZ(2 * pi * (seconds / 60))
          ..translate(0.0, radius - height / 2, 0.0),
        alignment: Alignment.center,
        child: Container(
          height: height,
          width: width,
          color: color,
        ));
  }
}

class ClockTextMarker extends StatelessWidget {
  const ClockTextMarker({
    super.key,
    required this.value,
    required this.maxValue,
    required this.radius,
  });
  final int value;
  final int maxValue;
  final double radius;

  @override
  Widget build(BuildContext context) {
    const width = AppSize.s42;
    const height = AppSize.s28;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(pi + 2 * pi * (value / maxValue))
        ..translate(0.0, radius - 35, 0.0)
        ..rotateZ(pi - 2 * pi * (value / maxValue)),
      child: SizedBox(
        width: width,
        height: height,
        child: Text(
          value.toString(),
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}