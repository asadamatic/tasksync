import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasksync/features/manager/domain/repos/tasks_repo.dart';
import 'package:tasksync/features/manager/presentation/notifiers/providers.dart';

import 'package:mockito/mockito.dart';
import 'package:tasksync/features/manager/presentation/notifiers/tasks_notifier.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  group('TaskNotifierProvider', () {
    test('should provide TaskNotifier', () {
      // Arrange
      final mockRepository = MockTaskRepository();
      final container = ProviderContainer(overrides: [
        taskRepositoryProvider.overrideWithValue(mockRepository),
      ]);

      // Act
      final taskNotifier = container.read(taskNotifierProvider.notifier);

      // Assert
      expect(taskNotifier, isA<TaskNotifier>());
    });
  });
}
