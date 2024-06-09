import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasksync/custom_navigator.dart';
import 'package:tasksync/features/manager/domain/entities/task.dart';
import 'package:tasksync/manager_app.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TaskStatusAdapter());
  await Hive.openBox<Task>('tasks');
  await Hive.openBox('testBox');


  // Initializing Navigation Helper Singleton
  CustomNavigationHelper.instance;
  runApp(const ManagerApp());
}
