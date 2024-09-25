import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/resources/assets_manager.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'package:multi_service/src/shared/ui_kit/svg_widget/svg_widget.dart';

Widget chromeWidget(BuildContext context, {double? width, double? height}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s8),
        color: Theme.of(context).colorScheme.surface.withOpacity(0.5)
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8, vertical: AppPadding.p12),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: AppSize.s60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s28),
                color: Theme.of(context).colorScheme.primaryContainer
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p12),
              child: Row(
                children: [
                  SVGWidget(svgPath: SVGManager.chrome, size: AppSize.s32,)
                ],
              ),
            ),
          ),
          Space.h8,
          Text('Search or type URL', style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
        ],
      ),
    ),
  );
}