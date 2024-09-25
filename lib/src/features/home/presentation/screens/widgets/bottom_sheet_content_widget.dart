import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_service/src/features/home/presentation/provider/widget_controller/widget_provider.dart';
import 'package:multi_service/src/features/widgets/chrome_widget/chrome_widget.dart';
import 'package:multi_service/src/shared/resources/assets_manager.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'package:multi_service/src/shared/ui_kit/inkwell_button_widget/inkwell_button_widget.dart';
import 'package:multi_service/src/shared/ui_kit/svg_widget/svg_widget.dart';
import 'package:multi_service/src/shared/ui_kit/text_form_field_widget/text_form_field_widget.dart';

class BottomSheetContentWidget extends StatefulWidget {
  const BottomSheetContentWidget({super.key, required this.ref});
  final WidgetRef ref;

  @override
  State<BottomSheetContentWidget> createState() => _BottomSheetContentWidgetState();
}

class _BottomSheetContentWidgetState extends State<BottomSheetContentWidget> {

  bool _iconTapped = false;

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
                      setState(() {
                        _iconTapped = true;
                      });
                      _showBottomSheetWithAnimation(context, chromeWidget(context), widget.ref);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        chromeWidget(context),
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



void _showBottomSheetWithAnimation(BuildContext context,Widget widget, WidgetRef ref) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Theme.of(context).hoverColor,
    isScrollControlled: true,
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: DurationConstant.d500,
    ),
    builder: (context) {
      return _buildBottomSheetContent(context, widget, ref).animate().slideY(
          begin: 1.0,
          end: 0.0,
          duration: 500.ms,
          curve: Curves.easeOut
      ).fadeIn(duration: 500.ms);
    },
  );
}

Widget _buildBottomSheetContent(BuildContext context, Widget widget, WidgetRef ref) {
  return Container(
    height: MediaQuery.sizeOf(context).height * 0.7,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppSize.s18),
        topRight: Radius.circular(AppSize.s18),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            IconManager.dragHandle,
            size: AppSize.s24,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Space.h8,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s6),
                    color: Theme.of(context).colorScheme.onSurface
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(AppPadding.p4),
                    child: SVGWidget(svgPath: SVGManager.chrome, size: AppSize.s28,),
                  )),
              Space.w4,
              Text('Chrome', style: Theme.of(context).textTheme.titleMedium,),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                      IconManager.close,
                      size: AppSize.s24,
                      color: Theme.of(context).colorScheme.onSecondary,
                  ),
              )
            ],
          ),
          Space.h16,
          Text(
            'Search',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ).animate().fadeIn(duration: 1500.ms),
          Space.h8,
          Text(
            'Search in chrome with your favorite search engine',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary),
          ).animate().fadeIn(duration: 1500.ms),
          Space.h32,
          Center(
            child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: widget.animate().moveY(begin: -600, end: 0, duration: 500.ms).scale(duration: 300.ms)),
          ),
          Space.h16,
          const Spacer(),
          InkwellButtonWidget(
            onTap: () {
              final widgetController = ref.read(widgetProvider.notifier);
              widgetController.addWidget(chromeWidget(context, width: 150, height: 250));
              Navigator.pop(context);
              Navigator.pop(context);
            },
            borderColor: Theme.of(context).colorScheme.onPrimary,
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            child: Row(
              children: [
                Icon(
                  IconManager.addMaterial,
                  size: AppSize.s24,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                Space.w4,
                Text(
                  'Add Widget',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
