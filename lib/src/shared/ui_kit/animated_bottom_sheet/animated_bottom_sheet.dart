import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';



void showAnimatedBottomSheet(
    {required BuildContext context,
    required WidgetRef ref,
    required Widget Function(BuildContext context, WidgetRef widgetRef, {Widget? widget})
        bottomSheetContent,
    Widget? widget}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Theme.of(context).hoverColor,
    isScrollControlled: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: DurationConstant.d500,
    ),
    builder: (context) {
      return bottomSheetContent(context, ref, widget: widget).animate().slideY(
        begin: 1.0,
        end: 0.0,
        duration: 500.ms,
        curve: Curves.easeOut
      ).fadeIn(duration: 500.ms);
    },
  );
}