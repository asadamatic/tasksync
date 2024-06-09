import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tasksync/core/values/string_literals.dart';
import 'package:tasksync/core/values/styles.dart';
import 'package:tasksync/custom_navigator.dart';
import 'package:tasksync/features/manager/presentation/notifiers/providers.dart';
import 'package:tasksync/features/manager/presentation/notifiers/task_state.dart';
import 'package:tasksync/features/manager/presentation/widgets/task.dart';

class TasksListScreen extends ConsumerWidget {
  const TasksListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskState = ref.watch(taskNotifierProvider);

    return Scaffold(
      body: Skeletonizer(
        enabled: taskState == TaskState.initial(),
        child: ListView.separated(
            padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding),
            itemBuilder: (context, index) => TaskWidget(task: taskState.tasks[index]),
            separatorBuilder: (context, index) => const SizedBox(
                  height: smallSpacing,
                ),
            itemCount: taskState.tasks.length),
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: ElevatedButton.icon(
          onPressed: () => CustomNavigationHelper.router.pushNamed(taskRouteName),
          label: const Text(addTaskText),
          icon: const Icon(Icons.add_outlined),
        ),
      ),
    );
  }
}
