import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasksync/features/manager/domain/entities/task.dart';
import 'package:tasksync/features/manager/presentation/notifiers/providers.dart';

class TaskWidget extends ConsumerWidget {
  const TaskWidget({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(task.title),
      trailing: IconButton(
          onPressed: () =>
              ref.read(taskNotifierProvider.notifier).deleteTask(task.id),
          icon: Icon(Icons.delete_outline)),
    );
  }
}
