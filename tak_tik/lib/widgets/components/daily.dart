import 'package:flutter/material.dart';

class DailyTaskUI extends StatelessWidget {
  final List<Map<String, dynamic>> tasks = [
    {'title': 'Work Out', 'selected': true},
    {'title': 'Daily Meeting', 'selected': true},
    {'title': 'Reading a Book', 'selected': false},
    {'title': 'Daily Meeting', 'selected': false},
    {'title': 'Assignment Revision', 'selected': false},
  ];

  DailyTaskUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Daily Task',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            final isSelected = task['selected'] as bool;

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blue.shade100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task['title']!,
                    style: TextStyle(
                      color: isSelected ? Colors.blue : Colors.black,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 2),
                      color: isSelected ? Colors.blue : Colors.transparent,
                    ),
                    child: isSelected
                        ? const Icon(Icons.circle, color: Colors.white, size: 12)
                        : null,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
