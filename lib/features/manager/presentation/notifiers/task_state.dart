
import 'package:tasksync/core/utils/dummy_data.dart';
import 'package:tasksync/features/manager/domain/entities/task.dart';

class TaskState {
  final List<Task> tasks;

  TaskState({
    required this.tasks,
  });

  TaskState.initial()
      : tasks = dummyTasks;
}
