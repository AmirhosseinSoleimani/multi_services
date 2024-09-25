import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/resources/assets_manager.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'package:multi_service/src/shared/ui_kit/svg_widget/svg_widget.dart';
import 'package:multi_service/src/shared/ui_kit/text_form_field_widget/text_form_field_widget.dart';

class BottomSheetContentWidget extends StatelessWidget {
  const BottomSheetContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              IconManager.dragHandle,
              size: AppSize.s24,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Space.h8,
            TextFormFieldWidget(
                controller: controller,
                prefixIcon: Icon(
                  IconManager.search,
                  size: AppSize.s24,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              hintText: 'Search Widget',
              hintStyle: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.secondary),
              textAlign: TextAlign.center,
              borderCoder: Theme.of(context).colorScheme.secondary,
              focusBorderCoder: Theme.of(context).colorScheme.primaryContainer,
            ),
            Space.h16,
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              padding: const EdgeInsets.all(AppPadding.p8),
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 0.8,
              children: List.generate(4, (index) {
                if ((index == 0)) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
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
                        Space.h8,
                        Text(
                          'Chrome',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          'Search',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                        )
                      ],
                    );
                } else {
                  return Center(
                  child: Text(
                    'Item ${index + 1}', // متن هر عنصر
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
