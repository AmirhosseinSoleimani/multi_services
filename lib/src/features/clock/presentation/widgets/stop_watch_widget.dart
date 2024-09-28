import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:multi_service/src/features/clock/presentation/widgets/stop_watch_rendered.dart';

class StopWatchWidget extends StatefulWidget {
  const StopWatchWidget({super.key});

  @override
  State<StopWatchWidget> createState() => _StopWatchWidgetState();
}

class _StopWatchWidgetState extends State<StopWatchWidget>
    with SingleTickerProviderStateMixin {
  bool isRunning = false;
  late final Ticker _ticker;
  Duration _previouslyElapsed = Duration.zero;
  Duration _currentlyElapsed = Duration.zero;

  Duration get _totalElapsed => _previouslyElapsed + _currentlyElapsed;

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _resetStopwatch() {
    setState(() {
      _ticker.stop();
      isRunning = false;
      _previouslyElapsed = Duration.zero;
      _currentlyElapsed = Duration.zero;
    });
  }

  void _pauseStopwatch() {
    setState(() {
      isRunning = false;
      _ticker.stop();
      _previouslyElapsed += _currentlyElapsed;
      _currentlyElapsed = Duration.zero;
    });
  }

  void _startStopwatch() {
    setState(() {
      isRunning = true;
      _ticker.start();
    });
  }

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {
        _currentlyElapsed = elapsed;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      final radius = constraint.maxWidth / 2;
      return StopWatchRenderer(
        onPause: _pauseStopwatch,
        startState: isRunning,
        elapsed: _totalElapsed,
        radius: radius,
        startCallback: _startStopwatch,
        resetCallback: _resetStopwatch,
      );
    });
  }
}
