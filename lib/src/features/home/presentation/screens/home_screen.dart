import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/resources/color_manager.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';


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
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onLongPress: _handleLongPress,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                color: Colors.yellow,
              ),
              if (_showIcon)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: AppSize.s80,
                        height: AppSize.s32,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s24)),
                          color: ColorLightManager.lightSilver,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: ColorLightManager.black,
                          ),
                        ),
                      ),
                      Container(
                        width: AppSize.s80,
                        height: AppSize.s32,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s24)),
                          color: ColorLightManager.lightSilver,
                        ),
                        child: Center(
                          child: Text(
                            'Done',
                            style: Theme.of(context).textTheme.titleMedium,
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
