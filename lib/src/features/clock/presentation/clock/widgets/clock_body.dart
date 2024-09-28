import 'package:flutter/material.dart';

import 'clock_face.dart';

class ClockBody extends StatefulWidget {
  const ClockBody({super.key});


  @override
  State<ClockBody> createState() => _ClockBodyState();
}

class _ClockBodyState extends State<ClockBody> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: Center(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  BoxShadow(
                    offset: const Offset(-4.0, -4.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ],
              ),

              child: const ClockFace(),
            ),
          ],
        ),
      ),
    );
  }
}