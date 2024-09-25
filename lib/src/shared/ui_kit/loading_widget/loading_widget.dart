import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color, this.size});

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: color ?? Theme.of(context).colorScheme.primary,
      size: size ?? AppSize.s28,
    );
  }
}