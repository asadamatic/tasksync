import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tasksync/core/utils/dummy_data.dart';
import 'package:tasksync/features/manager/domain/repos/tasks_repo.dart';
import 'package:tasksync/features/manager/domain/use_cases/add_task.dart';
import 'package:tasksync/features/manager/domain/use_cases/delete_task.dart';
import 'package:tasksync/features/manager/domain/use_cases/get_tasks.dart';

import '../repos/task_repo.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  late MockTaskRepository mockTaskRepository;
  late DeleteTaskUseCase deleteTaskUseCase;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    deleteTaskUseCase = DeleteTaskUseCase(mockTaskRepository);
  });
  test("Test Delete Task", () async {
    when(mockTaskRepository.deleteTask("")).thenAnswer((_) async {
      // Actual result
      return Future<void>.value();
    });
    final result = await deleteTaskUseCase("");

    verify(mockTaskRepository.deleteTask("")).called(1);
  });
}
