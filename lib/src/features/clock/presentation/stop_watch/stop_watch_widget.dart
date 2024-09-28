import 'package:flutter/material.dart';
import 'package:multi_service/src/features/clock/presentation/stop_watch/widgets/stop_watch.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';

class StopWatchWidget extends StatelessWidget {
  const StopWatchWidget({super.key, this.aspectRatio});
  final double? aspectRatio;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          children: [
            AspectRatio(aspectRatio: aspectRatio ?? 0.7, child: const StopWatch()),
          ],
        ),
      ),
    );
  }
}
