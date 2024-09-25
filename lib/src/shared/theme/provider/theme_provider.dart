

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_service/src/shared/theme/provider/theme_controller.dart';
import 'package:multi_service/src/shared/theme/provider/theme_state.dart';

final themeControllerProvider = AsyncNotifierProvider<ThemeController, ThemeState>(() {
  return ThemeController();
});