import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'widgets/clock_hand_hour.dart';
import 'widgets/clock_hand_minute.dart';
import 'widgets/clock_hand_second.dart';



class ClockHandsWidget extends StatefulWidget {
  const ClockHandsWidget({super.key, this.aspectRatio});
  final double? aspectRatio;

  @override
  State<ClockHandsWidget> createState() => _ClockHandsWidgetState();
}

class _ClockHandsWidgetState extends State<ClockHandsWidget> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: DurationConstant.d1000,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio ?? 1.0,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSize.s18),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final dateTime = DateTime.now();
            return Stack(
              fit: StackFit.expand,
              children: [
                CustomPaint(
                  painter: HourHandPainter(
                    hours: dateTime.hour,
                    minutes: dateTime.minute,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                CustomPaint(
                  painter: MinuteHandPainter(
                    minutes: dateTime.minute,
                    seconds: dateTime.second,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                CustomPaint(
                  painter: SecondHandPainter(
                    seconds: dateTime.second,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}