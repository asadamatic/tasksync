import 'package:flutter/material.dart';
import 'package:tasksync/core/utils/dummy_data.dart';
import 'package:tasksync/core/values/string_literals.dart';
import 'package:tasksync/core/values/styles.dart';
import 'package:tasksync/features/manager/presentation/widgets/task.dart';

class TasksListScreen extends StatelessWidget {
  const TasksListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          itemBuilder: (context, index) => TaskWidget(task: dummyTasks[index]),
          separatorBuilder: (context, index) => SizedBox(
                height: smallSpacing,
              ),
          itemCount: dummyTasks.length),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        child: ElevatedButton.icon(
          onPressed: () {},
          label: Text(addTaskText),
          icon: Icon(Icons.add_outlined),
        ),
      ),
    );
  }
}
