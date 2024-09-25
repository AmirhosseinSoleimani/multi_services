import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends AsyncNotifier<bool> {
  @override
  FutureOr<bool> build() => false;

  void changeStateToTrue() {
    state = const AsyncValue.data(true);
  }

  void changeStateToFalse() {
    state = const AsyncValue.data(false);
  }

  void toggleState() {
    state = AsyncValue.data(!(state.value ?? false));
  }

  Future<void> updateStateBasedOnCondition(bool condition) async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(condition);
  }
}