import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_service/src/features/home/domain/widget_entity/widget_entity.dart';
import 'package:multi_service/src/features/home/presentation/provider/widget_controller/widget_controller.dart';

final widgetProvider = StateNotifierProvider<WidgetController, List<WidgetEntity>>(
      (ref) => WidgetController(),
);