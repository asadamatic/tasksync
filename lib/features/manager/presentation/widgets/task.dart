import 'package:flutter/material.dart';
import 'package:tasksync/features/manager/domain/entities/task.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile.adaptive(
        title: Text(task.title),
        value: task.status.isCompleted,
        onChanged: (status) {});
  }
}
