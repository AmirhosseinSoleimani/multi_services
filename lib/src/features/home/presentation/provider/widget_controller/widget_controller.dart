import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_service/src/features/home/domain/widget_entity/widget_entity.dart';


class WidgetController extends StateNotifier<List<WidgetEntity>> {
  WidgetController() : super([]);


  void addWidget(Widget widget) {
    state = [...state, WidgetEntity(widget: widget, position: const Offset(100,100))];
  }

  void updateWidgetPosition(int index, Offset newPosition) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index)
          WidgetEntity(position: newPosition, widget: state[i].widget)
        else
          state[i],
    ];
  }
}