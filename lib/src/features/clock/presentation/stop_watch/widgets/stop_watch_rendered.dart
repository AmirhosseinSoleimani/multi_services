import 'dart:math';
import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'center_nob.dart';
import 'clock_hand.dart';
import 'clock_marker.dart';

class StopWatchRenderer extends StatelessWidget {
  const StopWatchRenderer(
      {super.key,
        required this.elapsed,
        required this.radius,
        required this.resetCallback,
        required this.startCallback,
        required this.startState,
        required this.onPause});
  final Duration elapsed;
  final double radius;
  final VoidCallback startCallback;
  final VoidCallback resetCallback;
  final bool startState;
  final VoidCallback onPause;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(left: radius, top: radius, child: const CenterNob()),
        ..._buildClockTextMarkers(),
        ..._buildClockMarkers(),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            rotateZ: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
            thickness: AppSize.s2,
            handLength: radius - AppSize.s18,
            color: Colors.red,
          ),
        ),
        // Positioned(
        //   left: 0,
        //   right: 0,
        //   top: radius * 1.3,
        //   child: ElapsedTimeText(elapsed: elapsed),
        // ),
        // ControlButtonsWidget(startCallback: startCallback, resetCallback: resetCallback, startState: startState, onPause: onPause),
      ],
    );
  }

  List<Widget> _buildClockTextMarkers() {
    return List.generate(12, (index) {
      final value = (index + 1) * 5;
      return Positioned(
        top: radius,
        left: radius,
        child: ClockTextMarker(value: value, maxValue: 60, radius: radius),
      );
    });
  }

  List<Widget> _buildClockMarkers() {
    return List.generate(60, (index) {
      return Positioned(
        left: radius,
        top: radius,
        child: ClockMarker(radius: radius, seconds: index),
      );
    });
  }


}