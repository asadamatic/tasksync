import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasksync/features/manager/data/repos/tasks_repo.dart';
import 'package:tasksync/features/manager/domain/repos/tasks_repo.dart';
import 'package:tasksync/features/manager/domain/use_cases/add_task.dart';
import 'package:tasksync/features/manager/domain/use_cases/delete_task.dart';
import 'package:tasksync/features/manager/domain/use_cases/get_tasks.dart';
import 'package:tasksync/features/manager/presentation/notifiers/task_state.dart';
import 'package:tasksync/features/manager/presentation/notifiers/tasks_notifier.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepositoryImpl();
});

final addTaskUseCaseProvider = Provider<AddTaskUseCase>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return AddTaskUseCase(repository);
});

final getTasksUseCaseProvider = Provider<GetTasksUseCase>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return GetTasksUseCase(repository);
});

final deleteTaskUseCaseProvider = Provider<DeleteTaskUseCase>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return DeleteTaskUseCase(repository);
});

final taskNotifierProvider =
    StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final addTaskUseCase = ref.watch(addTaskUseCaseProvider);
  final getTasksUseCase = ref.watch(getTasksUseCaseProvider);
  final deleteTaskUseCase = ref.watch(deleteTaskUseCaseProvider);
  return TaskNotifier(addTaskUseCase, getTasksUseCase, deleteTaskUseCase);
});
