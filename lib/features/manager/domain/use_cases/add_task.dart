

import 'package:tasksync/features/manager/domain/entities/task.dart';
import 'package:tasksync/features/manager/domain/repos/tasks_repo.dart';

class AddTaskUseCase {
  final TaskRepository repository;

  AddTaskUseCase(this.repository);

  Future<void> call(Task task) {
    return repository.addTask(task);
  }
}
