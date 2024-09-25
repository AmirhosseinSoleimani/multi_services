import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'bottom_sheet_content_widget.dart';



void showAnimatedBottomSheet(BuildContext context, WidgetRef ref, {Widget? widget}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Theme.of(context).hoverColor,
    isScrollControlled: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: DurationConstant.d500,
    ),
    builder: (context) {
      return _buildBottomSheetContent(context, ref).animate().slideY(
        begin: 1.0,
        end: 0.0,
        duration: 500.ms,
        curve: Curves.easeOut
      ).fadeIn(duration: 500.ms);
    },
  );
}
Widget _buildBottomSheetContent(BuildContext context, WidgetRef widgetRef) {
  return Container(
    height: MediaQuery.sizeOf(context).height * 0.7,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppSize.s18),
        topRight: Radius.circular(AppSize.s18),
      ),
    ),
    child: BottomSheetContentWidget(ref: widgetRef,),
  );
}