import 'package:flutter/material.dart';
import 'package:multi_service/src/features/home/presentation/screens/widgets/calendar_screen.dart';
import 'package:multi_service/src/features/home/presentation/screens/widgets/calendar_with_todo_screen.dart';
import 'package:multi_service/src/features/home/presentation/screens/widgets/clock_widget.dart';
import 'package:multi_service/src/features/home/presentation/screens/widgets/digital_clock.dart';
import 'package:multi_service/src/shared/resources/color_manager.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'package:multi_service/src/shared/theme/color_theme_extension.dart';
import 'package:webview_flutter/webview_flutter.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _showIcon = false;

  void _handleLongPress() {
    setState(() {
      _showIcon = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).extension<ColorThemeExtension>();
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onLongPress: _handleLongPress,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                color: colorTheme?.white,
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
                      SizedBox(
                          width: double.infinity,
                          height: 600,
                          child: CalendarPage(),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 1020,
                        child: CalendarWithTodoScreen(),
                      ),
                      SizedBox(
                          width: double.infinity,
                          height: 500,
                          child: ClockPage()),
                      SizedBox(
                        width: double.infinity,
                        height: 400,
                        child: DigitalClock(),
                      )
                    ],
                  ),
                ),
              ),
              if (_showIcon)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _showAnimatedBottomSheet(context);
                        },
                        child: Container(
                          width: AppSize.s80,
                          height: AppSize.s32,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s24)),
                            color: colorTheme?.lightSilver,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: colorTheme?.black,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _showIcon = false;
                          setState(() {
                          });
                        },
                        child: Container(
                          width: AppSize.s80,
                          height: AppSize.s32,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(AppSize.s24)),
                            color: colorTheme?.lightSilver,
                          ),
                          child: Center(
                            child: Text(
                              'Done',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
void _showAnimatedBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent, // برای نمایش پس‌زمینه شفاف
    transitionAnimationController: AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 500), // مدت زمان انیمیشن
    ),
    builder: (context) {
      return _buildBottomSheetContent(context);
    },
  );
}
Widget _buildBottomSheetContent(BuildContext context) {
  return Container(
    height: 300,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'This is a modal bottom sheet!',
            style: TextStyle(fontSize: 18),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    ),
  );
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