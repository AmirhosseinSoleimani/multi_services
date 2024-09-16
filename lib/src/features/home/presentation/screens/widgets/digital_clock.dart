import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class DigitalClock extends StatefulWidget {
  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock>
    with SingleTickerProviderStateMixin {
  TimeOfDay _currentTime = TimeOfDay.now();
  Timer? _timer;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();
  TimeOfDay? _alarmTime;

  @override
  void initState() {
    super.initState();

    // Start a timer to update the clock every second
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = TimeOfDay.now();
      });
    });

    // Initialize animation controller for color change
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.purple,
    ).animate(_controller);

    // Initialize notifications
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();

    const settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notificationsPlugin.initialize(settings);
  }

  Future<void> _scheduleAlarm(DateTime dateTime) async {
    const androidDetails = AndroidNotificationDetails(
      'alarm_channel',
      'Alarm',
      channelDescription: 'This channel is for alarm notifications',
      importance: Importance.max,
      priority: Priority.high,
      sound: RawResourceAndroidNotificationSound('alarm'),
      playSound: true,
    );

    const iosDetails = DarwinNotificationDetails(
      sound: 'alarm.aiff',
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // Convert DateTime to TZDateTime
    final tz.TZDateTime alarmTime = tz.TZDateTime.from(dateTime, tz.local);

    await _notificationsPlugin.zonedSchedule(
      0,
      'Alarm',
      'It\'s time!',
      alarmTime,
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    return DateFormat('HH:mm:ss').format(DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    ));
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != _alarmTime) {
      setState(() {
        _alarmTime = picked;
      });

      final now = DateTime.now();
      final alarmDateTime = DateTime(now.year, now.month, now.day,
          _alarmTime!.hour, _alarmTime!.minute);

      _scheduleAlarm(alarmDateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Digital Clock with Alarm'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _formatTime(_currentTime),
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: _colorAnimation.value,
                    fontFamily: 'Courier',
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: _colorAnimation.value!,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  _alarmTime != null
                      ? "Alarm set for: ${_alarmTime!.format(context)}"
                      : "No alarm set",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: _pickTime,
                  child: Text("Set Alarm"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}