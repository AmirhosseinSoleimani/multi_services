import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';



class AnimatedDialogBox extends StatefulWidget {
  const AnimatedDialogBox({super.key, required this.child});
  final Widget child;

  @override
  State<AnimatedDialogBox> createState() => _AnimatedDialogBoxState();
}

class _AnimatedDialogBoxState extends State<AnimatedDialogBox> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: DurationConstant.d500,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s18),
        ),
        child: Container(
            padding: const EdgeInsets.all(AppSize.s16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s18),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: widget.child
        ),
      ),
    );
  }
}