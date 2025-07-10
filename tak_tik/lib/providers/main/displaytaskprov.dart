import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tak_tik/models/Home/displayTaskmodel.dart';
import 'package:tak_tik/services/Auth.dart';

class Displaytaskprov with ChangeNotifier {
  List<DisplayTaskModel> _priorityTask = [];
  List<DisplayTaskModel> _dailyTask = [];
  bool _isLoading = true;
  List<DisplayTaskModel> get priorityTask => _priorityTask;
  List<DisplayTaskModel> get dailyTask => _dailyTask;
 Future<void> fetchTask() async {
  try {
    final token = await AuthService.getTokens();
    if (token == null) {
      log("Token not found");
      _isLoading = false;
      notifyListeners();
      return;
    }

    final response = await Dio().get(
      "https://simple-tasks-api-lkab.onrender.com/tasks/",
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    final List fetchedTask = response.data['tasks']; 

    _priorityTask.clear();
    _dailyTask.clear();

    for (var item in fetchedTask) {
      final task = DisplayTaskModel.fromJson(item);
      if (task.category == "Priority") {
        _priorityTask.add(task);
      } else {
        _dailyTask.add(task);
      }
    }

    _isLoading = false;
    notifyListeners();
  } catch (e) {
    log("Error fetching task: $e");
    _isLoading = false;
    notifyListeners();
  }
}
}
