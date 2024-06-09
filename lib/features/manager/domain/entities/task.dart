import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends Equatable {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  /// A property of type bool would have worked fine here, but the 
  /// use of enum allows to the expansion in the future.
  /// For example, we can accomodate [inProgress] and [overdue] states in
  /// future.
  final TaskStatus status;

  Task({
    String? id,
    required this.title,
    this.status = TaskStatus.pending,
  }) : id = id ?? const Uuid().v4();

  @override
  List<Object?> get props => [id, title, status];

  Task copyWith({
    String? id,
    String? title,
    TaskStatus? status,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
    );
  }

  @override
  String toString() => 'Task { id: $id, title: $title, status: $status }';
}

@HiveType(typeId: 1)
enum TaskStatus {
  @HiveField(0)
  pending,

  @HiveField(1)
  done;

  bool get isCompleted => this == TaskStatus.done;
}
