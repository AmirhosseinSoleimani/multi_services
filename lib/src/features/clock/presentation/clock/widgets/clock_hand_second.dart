import 'package:flutter/material.dart';
import 'dart:math';

import 'package:multi_service/src/shared/resources/value_manager.dart';


class SecondHandPainter extends CustomPainter {
  final Paint secondHandPaint;
  final int seconds;
  final Color color;

  SecondHandPainter({required this.seconds, required this.color}) :
    secondHandPaint = Paint()..color = color..style = PaintingStyle.fill;


  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);
    canvas.rotate(2 * pi * (seconds / 60));
    Path secondHand = Path()
    ..moveTo(-1.0, 15.0)
    ..lineTo(-1.0, -radius - radius / 7)
    ..lineTo(1.0, -radius - radius / 7)
    ..lineTo(1.0, 15.0)
    ..close();

    canvas.drawPath(secondHand, secondHandPaint);
    canvas.drawShadow(secondHand, Colors.black, 3.0, false);

    canvas.restore();

  }

  @override
  bool shouldRepaint(SecondHandPainter oldDelegate) {
    return true;
  }

}