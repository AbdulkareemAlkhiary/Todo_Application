// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:gesture_x_detector/gesture_x_detector.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';

class TaskTile extends StatefulWidget {
  final bool isChecked;
  final String taskTitle;
  final void Function(bool?) checkboxCallback;
  final ValueChanged<bool?> removed;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.removed,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return XGestureDetector(
      longPressTimeConsider: 350,
      onLongPress: (TapEvent event) {
        setState(() {
          print('Long Press Successful for task: ${widget.taskTitle}');
          widget.removed(true);
        });
      },
      child: ListTile(
        title: Text(
          widget.taskTitle,
          style: TextStyle(
              decoration: widget.isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: widget.isChecked,
          onChanged: widget.checkboxCallback,
        ),
      ),
    );
  }

  // void onLongPress(TapEvent event) {
  //   print('Long Press Successful for task: ${widget.taskTitle}');
  // }
}

// (bool? checkboxState) {
// setState(() {
// isChecked = checkboxState ?? true;
// });
// },
