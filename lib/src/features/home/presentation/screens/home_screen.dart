import 'package:flutter/material.dart';
import 'package:multi_service/src/features/shared/resources/color_manager.dart';
import 'package:multi_service/src/features/shared/resources/value_manager.dart';


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
    return Scaffold(
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
              Center(
                child: Container(
                  width: AppSize.s80,
                  height: AppSize.s24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(AppSize.s24)),
                    color: ColorLightManager.lightSilver,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
