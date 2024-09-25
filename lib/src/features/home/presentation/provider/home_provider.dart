

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_controller.dart';

final homeProvider = AsyncNotifierProvider<HomeController, bool>(() {
  return HomeController();
});