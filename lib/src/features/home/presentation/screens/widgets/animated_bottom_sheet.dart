import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';



void showAnimatedBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Theme.of(context).hoverColor,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: DurationConstant.d500,
    ),
    builder: (context) {
      return _buildBottomSheetContent(context).animate().slideY(
        begin: 1.0,
        end: 0.0,
        duration: 500.ms,
        curve: Curves.easeOut
      ).fadeIn(duration: 500.ms);
    },
  );
}
Widget _buildBottomSheetContent(BuildContext context) {
  return Container(
    height: AppSize.s300,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppSize.s18),
        topRight: Radius.circular(AppSize.s18),
      ),
    ),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'This is a modal bottom sheet!',
            style: TextStyle(fontSize: 18),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    ),
  );
}