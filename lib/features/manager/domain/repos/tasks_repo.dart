import 'package:tasksync/features/manager/domain/entities/task.dart';

abstract class TaskRepository {
  Future<void> addTask(Task task);
  Future<List<Task>> getTasks();
  Future<void> deleteTask(String id);
}
