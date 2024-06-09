
import 'package:tasksync/features/manager/domain/entities/task.dart';
import 'package:tasksync/features/manager/domain/repos/tasks_repo.dart';

class GetTasksUseCase {
  final TaskRepository repository;

  GetTasksUseCase(this.repository);

  Future<List<Task>> call() {
    return repository.getTasks();
  }
}
