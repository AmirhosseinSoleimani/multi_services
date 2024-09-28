import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_service/src/features/chrome/presentation/chrome_screen.dart';
import 'package:multi_service/src/shared/resources/value_manager.dart';
import 'package:multi_service/src/shared/ui_kit/inkwell_button_widget/inkwell_button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ChromeDialogWidget extends StatelessWidget {
  const ChromeDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final chromeAppUrl = Uri.parse('googlechrome://navigate?url=https://www.google.com');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Open Chrome',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Space.h16,
        Text(
          "How would you like to proceed?",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Space.h16,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: InkwellButtonWidget(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                borderColor: Theme.of(context).colorScheme.onPrimary,
                onTap: () async {
                  bool canLaunchChrome = await canLaunchUrl(chromeAppUrl);
                  if(canLaunchChrome) {
                    if (context.mounted) Navigator.pop(context);
                    await launchUrl(chromeAppUrl);
                  }
                },
                child: Text('Open with Chrome App', style: Theme.of(context).textTheme.bodyMedium,),
              ),
            ),
            Space.w12,
            Expanded(
              child: InkwellButtonWidget(
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                borderColor: Theme.of(context).colorScheme.onPrimary,
                onTap: () async {
                  Navigator.pop(context);
                  context.push(ChromeScreen.chromeScreenPath);
                },
                child: Text('Open in this App', style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
          ],
        ),
      ],
    );
  }
}