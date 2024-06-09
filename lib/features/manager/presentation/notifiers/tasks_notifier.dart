import 'package:riverpod/riverpod.dart';
import 'package:tasksync/features/manager/domain/entities/task.dart';
import 'package:tasksync/features/manager/domain/use_cases/add_task.dart';
import 'package:tasksync/features/manager/domain/use_cases/delete_task.dart';
import 'package:tasksync/features/manager/domain/use_cases/get_tasks.dart';

import 'task_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class TaskNotifier extends StateNotifier<TaskState> {
  final AddTaskUseCase _addTaskUseCase;
  final GetTasksUseCase _getTasksUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  TaskNotifier(
      this._addTaskUseCase, this._getTasksUseCase, this._deleteTaskUseCase)
      : super(TaskState.initial()) {
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final tasks = await _getTasksUseCase();
    state = TaskState(tasks: tasks);
  }

  Future<void> addTask(String title) async {
    final newTask = Task(title: title);
    await _addTaskUseCase(newTask);
    state = TaskState(tasks: [...state.tasks, newTask]);
  }

  Future<void> deleteTask(String id) async {
    await _deleteTaskUseCase(id);
    state =
        TaskState(tasks: state.tasks.where((task) => task.id != id).toList());
  }
}
