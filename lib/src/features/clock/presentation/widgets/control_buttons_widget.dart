import 'package:flutter/material.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'package:multi_service/src/shared/ui_kit/inkwell_button_widget/inkwell_button_widget.dart';

class ControlButtonsWidget extends StatelessWidget {
  const ControlButtonsWidget({super.key, required this.startCallback, required this.resetCallback, required this.startState, required this.onPause});
  final VoidCallback startCallback;
  final VoidCallback resetCallback;
  final bool startState;
  final VoidCallback onPause;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: InkwellButtonWidget(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              borderColor: Theme.of(context).colorScheme.onPrimary,
              onTap: resetCallback,
              child: Text(
                'Reset',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Space.w16,
          Expanded(
            child: InkwellButtonWidget(
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              borderColor: Theme.of(context).colorScheme.onPrimary,
              onTap: startState ? onPause : startCallback,
              child: startState ? Text('Pause', style: Theme.of(context).textTheme.titleMedium,) : Text('Start', style: Theme.of(context).textTheme.titleMedium,),
            ),
          ),
        ],
      ),
    );
  }
}