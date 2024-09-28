import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/resources/assets_manager.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'package:multi_service/src/shared/ui_kit/animated_dialog_box/animated_dialog_box.dart';
import 'package:multi_service/src/shared/ui_kit/svg_widget/svg_widget.dart';
import 'chrome_dialog_widget.dart';


class ChromeWidget extends StatelessWidget {
  const ChromeWidget({super.key, this.isSelected = false, this.width, this.height});
  final bool? isSelected;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return (isSelected ?? false) ? InkWell(
      onTap: () {
        showAnimatedDialog(context);
      },
      child: Container(
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
      ),
    ) : Container(
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
  void showAnimatedDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return const AnimatedDialogBox(child: ChromeDialogWidget(),);
      },
    );
  }
}


