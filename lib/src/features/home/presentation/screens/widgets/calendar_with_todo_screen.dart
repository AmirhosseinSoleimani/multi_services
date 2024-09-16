import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarWithTodoScreen extends StatefulWidget {
  const CalendarWithTodoScreen({super.key});

  @override
  _CalendarWithTodoScreenState createState() => _CalendarWithTodoScreenState();
}

class _CalendarWithTodoScreenState extends State<CalendarWithTodoScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  // A map to store tasks for each day
  Map<DateTime, List<Task>> _tasks = {};

  // A function to get tasks for a specific day
  List<Task> _getTasksForDay(DateTime day) {
    return _tasks[day] ?? [];
  }

  void _addOrEditTaskForDay(DateTime day, Task? taskToEdit) {
    TextEditingController taskController = TextEditingController(
      text: taskToEdit?.name ?? '',
    );
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(taskToEdit == null
              ? 'افزودن وظیفه برای ${day.toLocal()}'
              : 'ویرایش وظیفه برای ${day.toLocal()}'),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(hintText: 'نام وظیفه را وارد کنید'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('لغو'),
            ),
            TextButton(
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  setState(() {
                    if (taskToEdit == null) {
                      _tasks.putIfAbsent(day, () => []).add(Task(name: taskController.text));
                    } else {
                      taskToEdit.name = taskController.text;
                    }
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text(taskToEdit == null ? 'افزودن' : 'به‌روزرسانی'),
            ),
          ],
        );
      },
    );
  }

  void _toggleTaskCompletion(Task task) {
    setState(() {
      task.isCompleted = !task.isCompleted;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Planner Calendar'),
      ),
      body: Column(
        children: [
          // Calendar widget
          Expanded(
            child: TableCalendar(
              key: ValueKey(_calendarFormat),
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8.0),

          // Task list for the selected day
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'وظایف ${_selectedDay.toLocal()}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  Expanded(
                    child: _getTasksForDay(_selectedDay).isEmpty
                        ? Center(child: Text('هیچ وظیفه‌ای اضافه نشده است.'))
                        : ListView.builder(
                      itemCount: _getTasksForDay(_selectedDay).length,
                      itemBuilder: (context, index) {
                        Task task = _getTasksForDay(_selectedDay)[index];
                        return ListTile(
                          leading: Checkbox(
                            value: task.isCompleted,
                            onChanged: (_) => _toggleTaskCompletion(task),
                          ),
                          title: Text(
                            task.name,
                            style: TextStyle(
                              decoration: task.isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _addOrEditTaskForDay(_selectedDay, task),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => _addOrEditTaskForDay(_selectedDay, null),
                    child: Text('افزودن وظیفه جدید'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Task {
  String name;
  bool isCompleted;

  Task({required this.name, this.isCompleted = false});
}