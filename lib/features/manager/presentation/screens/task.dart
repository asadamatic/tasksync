import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasksync/core/utils/validators.dart';
import 'package:tasksync/core/values/string_literals.dart';
import 'package:tasksync/core/values/styles.dart';
import 'package:tasksync/custom_navigator.dart';
import 'package:tasksync/features/manager/presentation/notifiers/providers.dart';

class TaskScreen extends ConsumerStatefulWidget {
  const TaskScreen({super.key});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<TaskScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    final bool isThemeDark = colorScheme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(addTaskText),
      ),
      body: Padding(
        padding: const EdgeInsets.all(largeSpacing),
        child: Column(
          children: [
            Text(
              newTaskMessage,
              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: mediumSpacing,
            ),
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: hintTask,
                border: OutlineInputBorder(),
              ),
              validator: emptyFieldValidator,
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  ref
                      .read(taskNotifierProvider.notifier)
                      .addTask(_controller.text.trim());
                  CustomNavigationHelper.router.pop();
                }
              },
              child: const Text(submitTaskText),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
