import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_service/src/features/chrome/presentation/widgets/chrome_widget.dart';
import 'package:multi_service/src/features/clock/presentation/clock/clock_hands_widget.dart';
import 'package:multi_service/src/features/clock/presentation/stop_watch/stop_watch_widget.dart';
import 'package:multi_service/src/features/home/presentation/provider/widget_controller/widget_provider.dart';
import 'package:multi_service/src/shared/resources/assets_manager.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'package:multi_service/src/shared/ui_kit/inkwell_button_widget/inkwell_button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class ClockBottomSheetTypeWidget extends ConsumerWidget {
  const ClockBottomSheetTypeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController _pageController = PageController();
    int _currentIndex = 0;

    final List<String> titles = [
      'Clock',
      'World Clock',
      'Stopwatch',
      'Timer'
    ];

    final List<Widget> widgets = [
      const ClockHandsWidget(aspectRatio: 1.4),
      const ClockHandsWidget(aspectRatio: 1.4),
      const StopWatchWidget(aspectRatio: 1.4),
    ];

    final widgetController = ref.read(widgetProvider.notifier);
    return Padding(
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
                    child: Icon(IconManager.clock, size: AppSize.s28,),
                  )),
              Space.w4,
              Text('Time', style: Theme.of(context).textTheme.titleMedium,),
              const Spacer(),
              IconButton(
                onPressed: () {
                  context.pop();
                },
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
            'Clock',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ).animate().fadeIn(duration: 1500.ms),
          Space.h8,
          Text(
            'Add a clock for check a time',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSecondary),
          ).animate().fadeIn(duration: 1500.ms),
          Space.h32,
          Center(
            child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.6,
                child: const ClockHandsWidget(aspectRatio: 1.4,).animate().moveY(begin: -600, end: 0, duration: 500.ms).scale(duration: 300.ms)),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                // setState(() {
                //   _currentIndex = index;
                // });
              },
              itemCount: widgets.length,
              itemBuilder: (context, index) {
                return Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: widgets[index].animate().moveY(begin: -600, end: 0, duration: 500.ms).scale(duration: 300.ms),
                  ),
                );
              },
            ),
          ),
          Space.h16,
          SmoothPageIndicator(
            controller: _pageController,
            count: widgets.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Theme.of(context).colorScheme.primary,
              dotHeight: 8.0,
              dotWidth: 8.0,
            ),
          ),
          Space.h16,
          InkwellButtonWidget(
            onTap: () {
              widgetController.addWidget(const ChromeWidget(width: 150, height: 250, isSelected: true));
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
    );
  }
}
