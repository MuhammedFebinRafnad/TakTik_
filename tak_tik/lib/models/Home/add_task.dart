class AddTaskModel {
  final String title;
  final DateTime dueDate;
  final String category;
  final String priority;

  AddTaskModel(
      {required this.title, required this.dueDate, required this.category,required this.priority});

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "dueDate": dueDate.toUtc().toIso8601String(),
      "isCompleted": false,
      "priority": priority,
      "category": category
    };
  }
}
