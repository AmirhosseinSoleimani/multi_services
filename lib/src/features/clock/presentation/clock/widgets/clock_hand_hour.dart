import 'package:flutter/material.dart';
import 'dart:math';

class HourHandPainter extends CustomPainter {
  final Paint hourHandPaint;
  final int hours;
  final int minutes;
  final Color color;

  HourHandPainter({
    required this.hours,
    required this.minutes,
    required this.color,
  }) : hourHandPaint = Paint()
    ..color = color
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;

    canvas.save();
    canvas.translate(radius, radius);
    final double hourAngle = (hours >= 12
        ? 2 * pi * ((hours - 12) / 12 + (minutes / 720))
        : 2 * pi * ((hours / 12) + (minutes / 720)));
    canvas.rotate(hourAngle);
    final Path hourHand = Path()
      ..moveTo(-5, 10)
      ..lineTo(-5, -radius + radius / 3 + radius / 8)
      ..lineTo(5, -radius + radius / 3 + radius / 8)
      ..lineTo(5, 10)
      ..close();

    canvas.drawPath(hourHand, hourHandPaint);
    canvas.drawShadow(hourHand, Colors.black, 7.0, false);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant HourHandPainter oldDelegate) {
    return oldDelegate.hours != hours || oldDelegate.minutes != minutes || oldDelegate.color != color;
  }
}