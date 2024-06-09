import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tasksync/core/utils/dummy_data.dart';
import 'package:tasksync/features/manager/domain/repos/tasks_repo.dart';
import 'package:tasksync/features/manager/domain/use_cases/add_task.dart';
import 'package:tasksync/features/manager/domain/use_cases/get_tasks.dart';

import '../repos/task_repo.mocks.dart';

@GenerateMocks([TaskRepository])
void main() {
  late MockTaskRepository mockTaskRepository;
  late GetTasksUseCase getTasksUseCase;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    getTasksUseCase = GetTasksUseCase(mockTaskRepository);
  });
  test("Test Fetch Tasks", () async {
    when(mockTaskRepository.getTasks()).thenAnswer((_) async {
      // Actual result
      return dummyTasks;
    });
    final result = await getTasksUseCase();

    expect(result, dummyTasks);
  });
}
