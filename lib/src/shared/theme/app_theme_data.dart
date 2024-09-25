import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/resources/color_manager.dart';
import 'package:multi_service/src/shared/resources/font_manager.dart';
import 'package:multi_service/src/shared/resources/style_manager.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';

abstract class AppThemeData {
  ThemeData get materialThemeData;
  ThemeData get cupertinoThemeData;
}

class DarkThemeData extends AppThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      hoverColor: ColorDarkManager.transparent,
      colorScheme: ColorScheme(
        primary: ColorDarkManager.primary,
        onPrimary: ColorDarkManager.green,

        secondary: ColorDarkManager.lightSilver,
        onSecondary: ColorDarkManager.darkWhite,

        error: ColorDarkManager.red,
        onError: ColorDarkManager.white,

        surface: ColorDarkManager.black,
        onSurface: ColorDarkManager.white,
        primaryContainer: ColorDarkManager.lightBlack,
        secondaryContainer: ColorDarkManager.gold,
        surfaceContainer: ColorDarkManager.lightBlack2,


        brightness: Brightness.light,
      ),
      textTheme: TextTheme(
        headlineLarge: getBoldStyle(fontSize: AppSize.s20, color: ColorDarkManager.white),
        headlineMedium: getSemiBoldStyle(fontSize: AppSize.s20, color: ColorDarkManager.white),
        headlineSmall: getRegularStyle(fontSize: AppSize.s20, color: ColorDarkManager.white),

        titleLarge: getBoldStyle(fontSize: AppSize.s18, color: ColorDarkManager.white),
        titleMedium: getSemiBoldStyle(fontSize: AppSize.s18, color: ColorDarkManager.white),
        titleSmall: getRegularStyle(fontSize: AppSize.s18, color: ColorDarkManager.white),

        displayLarge: getBoldStyle(fontSize: AppSize.s16, color: ColorDarkManager.white),
        displayMedium: getSemiBoldStyle(fontSize: AppSize.s16, color: ColorDarkManager.white),
        displaySmall: getRegularStyle(fontSize: AppSize.s16, color: ColorDarkManager.white),

        bodyLarge: getBoldStyle(fontSize: AppSize.s14, color: ColorDarkManager.white),
        bodyMedium: getSemiBoldStyle(fontSize: AppSize.s14, color: ColorDarkManager.white),
        bodySmall: getRegularStyle(fontSize: AppSize.s14, color: ColorDarkManager.white),

        labelLarge: getBoldStyle(fontSize: AppSize.s12, color: ColorDarkManager.white),
        labelMedium: getSemiBoldStyle(fontSize: AppSize.s12, color: ColorDarkManager.white),
        labelSmall: getRegularStyle(fontSize: AppSize.s12, color: ColorDarkManager.white),
      ).apply(fontFamily: FontConstants.fontFamilyPersian)

  );


  @override
  // TODO: implement cupertinoThemeData
  ThemeData get cupertinoThemeData => throw UnimplementedError();

}

class LightThemeData extends AppThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
    brightness: Brightness.light,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontFamily: 'YekanBakhNoEn', package: 'component_library'),
    ),
  );

  @override
  // TODO: implement cupertinoThemeData
  ThemeData get cupertinoThemeData => throw UnimplementedError();


}
