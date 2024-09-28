import 'package:flutter/material.dart';
import 'dart:math';


class ClockDialPainter extends CustomPainter {
  final List<String> romanNumeralList = [
    'XII', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI'
  ];

  final ClockText clockText;
  final Color color;

  final double hourTickMarkLength = 8.0;
  final double minuteTickMarkLength = 4.0;
  final double hourTickMarkWidth = 2.0;
  final double minuteTickMarkWidth = 1.0;

  final Paint tickPaint = Paint();
  final TextPainter textPainter = TextPainter(
    textAlign: TextAlign.center,
    textDirection: TextDirection.rtl,
  );

  final TextStyle textStyle = const TextStyle(
    color: Colors.grey,
    fontFamily: 'Times New Roman',
    fontSize: 12.0,
  );

  ClockDialPainter({this.clockText = ClockText.roman, required this.color}) {
    tickPaint.color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    const double angle = 2 * pi / 60;

    canvas.save();
    canvas.translate(radius, radius);
    for (int i = 0; i < 60; i++) {
      final double tickMarkLength = i % 5 == 0 ? hourTickMarkLength : minuteTickMarkLength;
      tickPaint.strokeWidth = i % 5 == 0 ? hourTickMarkWidth : minuteTickMarkWidth;

      canvas.drawLine(
          Offset(0.0, -radius),
          Offset(0.0, -radius + tickMarkLength),
          tickPaint
      );
      if (i % 15 == 0) {
        canvas.save();
        canvas.translate(0.0, -radius + 20.0);

        textPainter.text = TextSpan(
          text: romanNumeralList[i ~/ 5],
          style: textStyle,
        );

        // Rotate canvas back to align text vertically
        canvas.rotate(-angle * i);

        textPainter.layout();
        textPainter.paint(
            canvas,
            Offset(-(textPainter.width / 2), -(textPainter.height / 2))
        );

        canvas.restore();
      }
      canvas.rotate(angle);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant ClockDialPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.clockText != clockText;
  }
}

enum ClockText {
  roman,
}