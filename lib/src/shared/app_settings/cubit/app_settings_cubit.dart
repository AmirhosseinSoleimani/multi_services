import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_service/src/services/local/local_storage.dart';
import 'package:multi_service/src/shared/app_settings/cubit/app_settings_state.dart';
import 'package:multi_service/src/shared/app_settings/data/model/app_brightness_model.dart';
import 'package:multi_service/src/shared/app_settings/domain/app_brightness.dart';
import 'package:multi_service/src/shared/app_settings/domain/entity/app_brightness_entity.dart';
import 'package:multi_service/src/shared/resources/app_constants.dart';
import 'package:rxdart/rxdart.dart';

class AppSettingsCubit extends Cubit<AppSettingsState> {
  AppSettingsCubit({
    required this.keyValueStorage,
  })  : _localStorage = LocalStorage(),
        super(const AppSettingsState());

  final LocalStorage _localStorage;
  final KeyValueStorage keyValueStorage;
  final BehaviorSubject<AppBrightnessMode> _appBrightnessModeSubject =
      BehaviorSubject();

  Stream<AppBrightnessMode> getAppBrightnessMode() async* {
    if (!_appBrightnessModeSubject.hasValue) {
      final appBrightnessMode =
          _localStorage.get(keyValueStorage.appBrightnessModeKey);
      AppBrightnessEntity appBrightness =
          AppBrightnessModel(appBrightnessMode: appBrightnessMode)
              .toDomainModel();
      _appBrightnessModeSubject.add(
          appBrightness.appBrightness ?? AppBrightnessMode.useSystemSetting);
    }
    yield* _appBrightnessModeSubject.stream;
  }
}
