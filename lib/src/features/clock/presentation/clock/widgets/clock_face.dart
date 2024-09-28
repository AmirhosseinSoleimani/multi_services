import 'package:flutter/material.dart';
import 'package:multi_service/src/features/clock/presentation/clock/clock_hands_widget.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';

import 'clock_dial_painter.dart';


class ClockFace extends StatefulWidget {
  const ClockFace({super.key});

  @override
  State<ClockFace> createState() => _ClockFaceState();
}

class _ClockFaceState extends State<ClockFace> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Stack(
              children: <Widget>[
                //Dial, numbers, and hands will go here
                SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: ClockDialPainter(
                      clockText: ClockText.roman,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                const ClockHandsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}