class Task {
  final bool isDone;
  final String id;
  final String title;
  final String description;

  Task({
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

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      isDone: map['isDone'] == 1,
      title: map['title'],
      description: map['description'],
    );
  }
}
