import 'package:flutter/material.dart';
import 'package:multi_service/src/features/home/presentation/screens/home_screen.dart';
import 'package:multi_service/src/shared/app_settings/cubit/app_settings_cubit.dart';
import 'package:multi_service/src/shared/app_settings/cubit/app_settings_state.dart';
import 'package:multi_service/src/shared/app_settings/domain/app_brightness.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_service/src/shared/resources/app_constants.dart';
import 'package:multi_service/src/shared/theme/app_theme.dart';
import 'package:multi_service/src/shared/theme/app_theme_data.dart';

class MyApp extends StatelessWidget {
   MyApp({super.key});

  final LightThemeData _lightTheme = LightThemeData();
  final DarkThemeData _darkTheme = DarkThemeData();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppSettingsCubit(keyValueStorage: KeyValueStorage(),),
        child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
          builder: (context, state) {
            return StreamBuilder(
              stream: context.watch<AppSettingsCubit>().getAppBrightnessMode(),
              builder: (context, snapshot) {
                final brightnessMode = snapshot.data;
                if(snapshot.hasData) {
                  return AppTheme(
                    lightTheme: _lightTheme,
                    darkTheme: _darkTheme,
                    child: MaterialApp(
                      title: 'Flutter Demo',
                      theme: _lightTheme.materialThemeData,
                      darkTheme: _darkTheme.materialThemeData,
                      themeMode: brightnessMode?.toThemeMode(),
                      home: const HomeScreen(),
                    ),
                  );
                }
                return const SizedBox();
              },
            );
          },
        ),
    );
  }
}



extension on AppBrightnessMode {
  ThemeMode toThemeMode() {
    switch (this) {
      case AppBrightnessMode.alwaysDark:
        return ThemeMode.dark;
      case AppBrightnessMode.alwaysLight:
        return ThemeMode.light;
      case AppBrightnessMode.useSystemSetting:
        return ThemeMode.system;
    }
  }
}

