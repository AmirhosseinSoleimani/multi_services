import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class ClockPage extends StatefulWidget {
  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  late FlutterLocalNotificationsPlugin _notificationsPlugin;
  TimeOfDay _selectedAlarmTime = TimeOfDay.now();
  Timer? _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    // Initialize notifications
    _notificationsPlugin = FlutterLocalNotificationsPlugin();
    final initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    _notificationsPlugin.initialize(initializationSettings);

    // Start timer to update current time every second
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _scheduleAlarm(TimeOfDay time) {
    final now = DateTime.now();
    DateTime alarmDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    if (alarmDateTime.isBefore(now)) {
      // اگر زمان انتخاب شده گذشته باشد، هشدار برای روز بعد تنظیم می‌شود
      alarmDateTime = alarmDateTime.add(Duration(days: 1));
    }

    final tz.TZDateTime tzAlarmTime = tz.TZDateTime.from(alarmDateTime, tz.local);

    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_channel_id',
      'Alarm Notifications',
      channelDescription: 'Channel for alarm notifications',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    final platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: DarwinNotificationDetails(),
    );

    _notificationsPlugin.zonedSchedule(
      0,
      'Alarm',
      'It\'s time!',
      tzAlarmTime,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time, // Repeat daily at the same time
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Alarm set for ${time.format(context)}')),
    );
  }

  Future<void> _selectTime() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedAlarmTime,
    );
    if (pickedTime != null && pickedTime != _selectedAlarmTime) {
      setState(() {
        _selectedAlarmTime = pickedTime;
      });
      _scheduleAlarm(pickedTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Clock with Alarm'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomClock(
              currentTime: _currentTime,
            ),
            SizedBox(height: 20),
            Text(
              'Current Time: ${_formatTime(_currentTime)}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _selectTime,
              child: Text('Set Alarm'),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}";
  }
}

class CustomClock extends StatelessWidget {
  final DateTime currentTime;

  CustomClock({required this.currentTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      child: CustomPaint(
        painter: ClockPainter(currentTime: currentTime),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final DateTime currentTime;

  ClockPainter({required this.currentTime});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - 10;

    // Draw clock circle
    canvas.drawCircle(center, radius, paint);

    // Draw hour marks
    for (int i = 0; i < 12; i++) {
      double angle = (i * 30) * pi / 180;
      double innerRadius = radius - 10;
      double outerRadius = radius;
      Offset innerPoint = Offset(
        center.dx + innerRadius * cos(angle - pi / 2),
        center.dy + innerRadius * sin(angle - pi / 2),
      );
      Offset outerPoint = Offset(
        center.dx + outerRadius * cos(angle - pi / 2),
        center.dy + outerRadius * sin(angle - pi / 2),
      );
      canvas.drawLine(innerPoint, outerPoint, paint);
    }

    // Calculate angles for hour, minute, and second hands
    double hour = currentTime.hour.toDouble();
    double minute = currentTime.minute.toDouble();
    double second = currentTime.second.toDouble();

    double hourAngle = ((hour % 12) + minute / 60) * 30 * pi / 180;
    double minuteAngle = (minute + second / 60) * 6 * pi / 180;
    double secondAngle = second * 6 * pi / 180;

    // Draw hour hand
    final hourHandPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;
    Offset hourHand = Offset(
      center.dx + (radius * 0.5) * cos(hourAngle - pi / 2),
      center.dy + (radius * 0.5) * sin(hourAngle - pi / 2),
    );
    canvas.drawLine(center, hourHand, hourHandPaint);

    // Draw minute hand
    final minuteHandPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;
    Offset minuteHand = Offset(
      center.dx + (radius * 0.7) * cos(minuteAngle - pi / 2),
      center.dy + (radius * 0.7) * sin(minuteAngle - pi / 2),
    );
    canvas.drawLine(center, minuteHand, minuteHandPaint);

    // Draw second hand
    final secondHandPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;
    Offset secondHand = Offset(
      center.dx + (radius * 0.9) * cos(secondAngle - pi / 2),
      center.dy + (radius * 0.9) * sin(secondAngle - pi / 2),
    );
    canvas.drawLine(center, secondHand, secondHandPaint);

    // Draw center dot
    final centerDotPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 5, centerDotPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true; // Always repaint to update the clock
  }
}