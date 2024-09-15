import 'package:multi_service/src/shared/app_settings/data/model/app_brightness_model.dart';
import 'package:multi_service/src/shared/app_settings/domain/app_brightness.dart';

class AppBrightnessEntity {
  final AppBrightnessMode? appBrightness;
  AppBrightnessEntity({this.appBrightness});
}

extension AppBrightnessModelToEntity on AppBrightnessModel {
  AppBrightnessEntity  toDomainModel() {
    AppBrightnessMode? mode;
      switch (appBrightnessMode) {
        case 'alwaysLight':
          mode =  AppBrightnessMode.alwaysLight;
          break;
        case 'alwaysDark':
          mode =  AppBrightnessMode.alwaysDark;
          break;
        case 'useSystemSetting':
          mode = AppBrightnessMode.useSystemSetting;
          break;
        default:
          mode = AppBrightnessMode.useSystemSetting;
      }
      return AppBrightnessEntity(appBrightness: mode);
    }
}