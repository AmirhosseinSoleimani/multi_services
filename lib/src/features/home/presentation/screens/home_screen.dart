import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_service/src/features/home/presentation/provider/home_provider.dart';
import 'package:multi_service/src/features/home/presentation/screens/widgets/animated_bottom_sheet.dart';
import 'package:multi_service/src/shared/resources/assets_manager.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomeScreen extends ConsumerWidget {
  static const homeScreenPath = '/';
  static const homeScreenName = 'homeScreen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);
    final controller = ref.read(homeProvider.notifier);
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onLongPress: () => controller.changeStateToTrue(),
          child: Stack(
            children: [
              Container(
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
                      // SizedBox(
                      //     width: double.infinity,
                      //     height: 600,
                      //     child: CalendarPage(),
                      // ),
                      // SizedBox(
                      //   width: double.infinity,
                      //   height: 1020,
                      //   child: CalendarWithTodoScreen(),
                      // ),
                      // SizedBox(
                      //     width: double.infinity,
                      //     height: 500,
                      //     child: ClockPage()),
                      // SizedBox(
                      //   width: double.infinity,
                      //   height: 400,
                      //   child: DigitalClock(),
                      // ),
                      // SizedBox(
                      //   width: double.infinity,
                      //   height: 400,
                      //   child: ParsiMap(),
                      // ),
                      // SizedBox(
                      //   width: double.infinity,
                      //   height: 400,
                      //   child: MapScreen(),
                      // ),
                      // SizedBox(
                      //   width: double.infinity,
                      //   height: 600,
                      //   child: NewsScreen(),
                      // )
                    ],
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
                        GestureDetector(
                          onTap: () {
                            showAnimatedBottomSheet(context);
                          },
                          child: Container(
                            width: AppSize.s80,
                            height: AppSize.s32,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(AppSize.s24)),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: Center(
                              child: Icon(
                                IconManager.addCupertino,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref.read(homeProvider.notifier).changeStateToFalse();
                          },
                          child: Container(
                            width: AppSize.s80,
                            height: AppSize.s32,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(AppSize.s24)),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: Center(
                              child: Text(
                                'Done',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.surface
                                ),
                              ),
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