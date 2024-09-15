import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/resources/color_manager.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'package:multi_service/src/shared/theme/color_theme_extension.dart';


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