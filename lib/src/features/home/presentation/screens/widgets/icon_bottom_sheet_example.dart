import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class IconBottomSheetExample extends StatefulWidget {
  const IconBottomSheetExample({super.key});

  @override
  _IconBottomSheetExampleState createState() => _IconBottomSheetExampleState();
}

class _IconBottomSheetExampleState extends State<IconBottomSheetExample> {
  bool _iconTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: Text('Search Widget'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _iconTapped = true;
            });
            _showBottomSheetWithAnimation(context);
          },
          child: Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.search,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            ).animate().scale(duration: 300.ms),
          ),
        ),
      ),
    );
  }

  void _showBottomSheetWithAnimation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return _buildBottomSheetContent(context);
      },
    );
  }

  Widget _buildBottomSheetContent(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      maxChildSize: 0.8,
      minChildSize: 0.4,
      builder: (_, controller) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // عنوان آیکون در بالای bottomsheet
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Search Widget',
                  style: Theme.of(context).textTheme.headlineMedium,
                ).animate().fadeIn(duration: 500.ms),
              ),
              // آیکون که از مکان اصلی‌اش به مرکز منتقل می‌شود
              Center(
                child: Icon(
                  Icons.search,
                  size: 50,
                  color: Theme.of(context).colorScheme.primary,
                ).animate().moveY(begin: -300, end: 0, duration: 500.ms).scale(duration: 300.ms),
              ),
              const SizedBox(height: 20),
              // سایر محتوا در BottomSheet
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}