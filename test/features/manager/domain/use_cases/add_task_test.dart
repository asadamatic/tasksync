import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tasksync/core/utils/dummy_data.dart';
import 'package:tasksync/features/manager/domain/entities/task.dart';
import 'package:tasksync/features/manager/domain/repos/tasks_repo.dart';
import 'package:tasksync/features/manager/domain/use_cases/add_task.dart';
import 'package:tasksync/features/manager/domain/use_cases/delete_task.dart';
import 'package:tasksync/features/manager/domain/use_cases/get_tasks.dart';

import '../repos/task_repo.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  late MockTaskRepository mockTaskRepository;
  late AddTaskUseCase addTaskUseCase;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    addTaskUseCase = AddTaskUseCase(mockTaskRepository);
  });
  test("Test Add Task", () async {
    final newTask = Task(title: "Test Task");
    when(mockTaskRepository.addTask(newTask)).thenAnswer((_) async {
      // Actual result
      return Future<void>.value();
    });
    final result = await addTaskUseCase(newTask);

    verify(mockTaskRepository.addTask(newTask)).called(1);
  });
}
