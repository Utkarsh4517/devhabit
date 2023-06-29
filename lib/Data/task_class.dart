class Task {
  final String title;
  final String description;
  final String userId;
  final String taskId;
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.taskId,
    required this.userId,
    this.isCompleted = false,
  });
}
