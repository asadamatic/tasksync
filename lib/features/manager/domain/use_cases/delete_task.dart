
import 'package:tasksync/features/manager/domain/repos/tasks_repo.dart';

class DeleteTaskUseCase {
  final TaskRepository repository;

  DeleteTaskUseCase(this.repository);

  Future<void> call(String id) {
    return repository.deleteTask(id);
  }
}
