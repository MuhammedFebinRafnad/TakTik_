import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  final String? initialTitle;
  final DateTime? initialDueDate;
  final String? initialCategory;
  final String? initialDescription;

  const TaskForm(
      {super.key,
      this.initialTitle,
      this.initialDueDate,
      this.initialCategory,
      this.initialDescription});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Text("Start"), Text("data")],
    );
  }
}
