
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasksync/core/utils/utils.dart';
import 'package:tasksync/features/manager/presentation/screens/task.dart';
import 'package:tasksync/features/manager/presentation/screens/tasks_list.dart';


const String tasksListRouteName = 'tasks_list_route';
const String taskRouteName = 'task';


/// In Flutter, it’s often beneficial to have a centralized navigation helper,
/// especially if you’re working with multiple routes and navigators. Here,
/// we implement the singleton pattern for our navigation helper
///
/// This code defines a singleton instance of the CustomNavigationHelper.
/// This ensures that only a single instance of this class is created and shared
/// throughout the application.
/// ```
/// static final CustomNavigationHelper _instance =
/// CustomNavigationHelper._internal();

/// static CustomNavigationHelper get instance => _instance;
/// ```
///
///
class CustomNavigationHelper {
  static final CustomNavigationHelper _instance =
      CustomNavigationHelper._internal();

  static CustomNavigationHelper get instance => _instance;

  static late final GoRouter router;

  static final GlobalKey<NavigatorState> parentNavigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  factory CustomNavigationHelper() {
    return _instance;
  }

  CustomNavigationHelper._internal() {
    final routes = <RouteBase>[
   

      GoRoute(
          parentNavigatorKey: parentNavigatorKey,
          path: tasksListRouteName.route,
          name: tasksListRouteName,
          builder: (context, state) {
            return TasksListScreen();
          },
          routes: [
            GoRoute(
              parentNavigatorKey: parentNavigatorKey,
              path: taskRouteName,
              name: taskRouteName,
              builder: (context, state) {

                return TaskScreen();
              },
            
            ),
          ]),

      
    ];

    router = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: tasksListRouteName.route,
      routes: routes,
    );
  }
}
