import 'package:flutter/material.dart';
import 'dart:math';


class MinuteHandPainter extends CustomPainter {
  final Paint minuteHandPaint;
  final int minutes;
  final int seconds;
  final Color color;

  MinuteHandPainter({
    required this.minutes,
    required this.seconds,
    required this.color,
  }) : minuteHandPaint = Paint()
    ..color = color
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;

    canvas.save();
    canvas.translate(radius, radius);
    canvas.rotate(2 * pi * ((minutes + (seconds / 60)) / 60));
    final Path minuteHand = Path()
      ..moveTo(-3.5, 13.0)
      ..lineTo(-3.5, -radius + radius / 10)
      ..lineTo(3.5, -radius + radius / 10)
      ..lineTo(3.5, 13.0)
      ..close();

    canvas.drawPath(minuteHand, minuteHandPaint);
    canvas.drawShadow(minuteHand, Colors.black, 4.0, false);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant MinuteHandPainter oldDelegate) {
    return oldDelegate.minutes != minutes || oldDelegate.seconds != seconds || oldDelegate.color != color;
  }
}