

import 'package:json_annotation/json_annotation.dart';
part 'app_brightness_model.g.dart';

@JsonSerializable()
class AppBrightnessModel {
  final String? appBrightnessMode;

  AppBrightnessModel ({this.appBrightnessMode});
}