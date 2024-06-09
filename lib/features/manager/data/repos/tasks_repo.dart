import 'package:hive/hive.dart';
import 'package:tasksync/features/manager/domain/entities/task.dart';
import 'package:tasksync/features/manager/domain/repos/tasks_repo.dart';

class TaskRepositoryImpl implements TaskRepository {
  final Box<Task> taskBox;

  TaskRepositoryImpl() : taskBox = Hive.box<Task>('tasks');

  @override
  Future<void> addTask(Task task) async {
    await taskBox.put(task.id, task);
  }

  @override
  Future<List<Task>> getTasks() async {
    return taskBox.values.toList();
  }

  @override
  Future<void> deleteTask(String id) async {
    await taskBox.delete(id);
  }
}
