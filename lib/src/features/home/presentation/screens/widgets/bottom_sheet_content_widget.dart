import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_service/src/features/chrome/presentation/widgets/chrome_widget.dart';
import 'package:multi_service/src/features/chrome/presentation/widgets/chrome_bottom_sheet_type_widget.dart';
import 'package:multi_service/src/features/home/presentation/screens/widgets/animated_bottom_sheet.dart';
import 'package:multi_service/src/shared/resources/assets_manager.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'package:multi_service/src/shared/ui_kit/text_form_field_widget/text_form_field_widget.dart';
import 'bottom_sheet_content.dart';

class BottomSheetContentWidget extends StatefulWidget {
  const BottomSheetContentWidget({super.key, required this.ref});
  final WidgetRef ref;

  @override
  State<BottomSheetContentWidget> createState() => _BottomSheetContentWidgetState();
}

class _BottomSheetContentWidgetState extends State<BottomSheetContentWidget> {

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
                  return InkWell(
                    onTap: () {
                      showAnimatedBottomSheet(context: context, ref: widget.ref, bottomSheetContent: (BuildContext context, WidgetRef ref, {Widget? widget}) {
                        return buildBottomSheetContentType(context, const ChromeBottomSheetTypeWidget());
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ChromeWidget(),
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
                    ),
                  );
                } else {
                  return Center(
                  child: Text(
                    'Item ${index + 1}', // متن هر عنصر
                    style: const TextStyle(
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
