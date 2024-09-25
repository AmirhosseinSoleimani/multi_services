import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_service/src/features/home/presentation/provider/home_controller/home_provider.dart';
import 'package:multi_service/src/features/home/presentation/provider/widget_controller/widget_provider.dart';
import 'package:multi_service/src/features/home/presentation/screens/widgets/animated_bottom_sheet.dart';
import 'package:multi_service/src/shared/resources/assets_manager.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'package:multi_service/src/shared/ui_kit/icon_button_widget/icon_button_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomeScreen extends ConsumerWidget {
  static const homeScreenPath = '/';
  static const homeScreenName = 'homeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final controller = ref.read(homeProvider.notifier);
    final widgets = ref.watch(widgetProvider);
    final widgetController = ref.read(widgetProvider.notifier);
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onLongPress: () => controller.changeStateToTrue(),
          onTap: () => controller.changeStateToFalse(),
          child: Stack(
            children: [
              (widgets.isEmpty) ?
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GoogleSearchScreen(query: 'Flutter development'),
                            ),
                          );
                        },
                        child: Text('dd'),
                      ),
                    ],
                  ),
                ),
              ) :
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p28),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(AppPadding.p16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: widgets.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        child: Center(child: widgets[index].widget),
                      );
                    },
                  ),
                ),
              ),
              AnimatedOpacity(
                  duration: DurationConstant.d500,
                  opacity: (state.value ?? false) ?  AppSize.s1 : AppSize.s0,
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButtonWidget(
                          onTap: () {
                            showAnimatedBottomSheet(context, ref);
                          },
                          iconData: IconManager.addCupertino,
                          iconColor: Theme.of(context).colorScheme.surface,
                          backgroundColor: Theme.of(context).colorScheme.secondary,

                        ),
                        IconButtonWidget(
                          onTap: () {
                            controller.changeStateToFalse();
                          },
                          iconColor: Theme.of(context).colorScheme.surface,
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          child: Text(
                            'Done',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Theme.of(context).colorScheme.surface
                            ),
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}



class GoogleSearchScreen extends StatefulWidget {
  final String query;

  const GoogleSearchScreen({Key? key, required this.query}) : super(key: key);

  @override
  _GoogleSearchScreenState createState() => _GoogleSearchScreenState();
}

class _GoogleSearchScreenState extends State<GoogleSearchScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize for Android WebView support (for iOS no need)
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.google.com/search?q=${widget.query}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Search'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}