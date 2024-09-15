
import 'package:multi_service/src/shared/app_settings/domain/app_brightness.dart';

class AppSettingsState {
  final AppBrightnessMode brightnessMode;
  final String locale;

  const AppSettingsState({
    this.brightnessMode = AppBrightnessMode.useSystemSetting,
    this.locale = 'en',
  });
  AppSettingsState copyWith({
    AppBrightnessMode? brightnessMode,
    String? locale,
  }) {
    return AppSettingsState(
      brightnessMode: brightnessMode ?? this.brightnessMode,
      locale: locale ?? this.locale,
    );
  }
}