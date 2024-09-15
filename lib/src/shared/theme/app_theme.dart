import 'package:flutter/material.dart';
import 'app_theme_data.dart';


class AppTheme extends InheritedWidget {
  const AppTheme({
    super.key,
    required super.child,
    required this.lightTheme,
    required this.darkTheme,
  });
  final AppThemeData lightTheme;
  final AppThemeData darkTheme;

  @override
  bool updateShouldNotify(AppTheme oldWidget) =>
      oldWidget.lightTheme != lightTheme || oldWidget.darkTheme != darkTheme;

  static AppThemeData of(BuildContext context) {
    final AppTheme? inheritedTheme = context.dependOnInheritedWidgetOfExactType<AppTheme>();
    assert(inheritedTheme != null,
    'No ParsePoolTheme found in the current context');
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? inheritedTheme!.darkTheme : inheritedTheme!.lightTheme;
  }
}