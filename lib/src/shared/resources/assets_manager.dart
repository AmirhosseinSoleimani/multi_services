import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageManager {}


class IconManager {
  // Cupertino Icons
  static const IconData addCupertino = CupertinoIcons.add;

  // Material Icons
  static const IconData addMaterial = Icons.add;
  static const IconData dragHandle = Icons.drag_handle_outlined;
  static const IconData search = Icons.search_outlined;
  static const IconData close = Icons.close;
  static const IconData clock = Icons.timer_outlined;

}

class SVGManager {
  static const String sun = 'assets/svg/theme/sun.svg';
  static const String moon = 'assets/svg/theme/moon.svg';
  static const String brightnessAuto = 'assets/svg/theme/brightness-auto.svg';
  static const String chrome = 'assets/svg/bottom_sheet/chrome.svg';
}
