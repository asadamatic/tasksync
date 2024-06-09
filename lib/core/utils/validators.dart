import 'package:tasksync/core/values/string_literals.dart';

String? emptyFieldValidator(String? value) => value == null || value.isEmpty ? emptyFieldMessage : null;