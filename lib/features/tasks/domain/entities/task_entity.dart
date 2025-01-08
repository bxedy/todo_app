import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final bool isDone;
  final String id;
  final String title;
  final String description;

  const TaskEntity({
    required this.id,
    required this.isDone,
    required this.title,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isDone': isDone ? 1 : 0,
      'title': title,
      'description': description,
    };
  }

  factory TaskEntity.fromMap(Map<String, dynamic> map) {
    return TaskEntity(
      id: map['id'],
      isDone: map['isDone'] == 1,
      title: map['title'],
      description: map['description'],
    );
  }

  TaskEntity copyWith({
    bool? isDone,
    String? id,
    String? title,
    String? description,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [isDone, id, title, description];
}
