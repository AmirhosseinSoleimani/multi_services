

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'bottom_sheet_content_widget.dart';

Widget buildBottomSheetContent(BuildContext context, WidgetRef widgetRef) {
  return Container(
    height: MediaQuery.sizeOf(context).height * 0.7,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppSize.s18),
        topRight: Radius.circular(AppSize.s18),
      ),
    ),
    child: BottomSheetContentWidget(ref: widgetRef,),
  );
}

Widget buildBottomSheetContentType(BuildContext context, Widget widget) {
  return Container(
    height: MediaQuery.sizeOf(context).height * 0.7,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primaryContainer,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(AppSize.s18),
        topRight: Radius.circular(AppSize.s18),
      ),
    ),
    child: widget
  );
}