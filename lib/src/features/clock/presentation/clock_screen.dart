import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'widgets/stop_watch_widget.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p16),
        child: Column(
          children: [
            AspectRatio(aspectRatio: 0.7, child: StopWatchWidget()),
          ],
        ),
      ),
    );
  }
}
