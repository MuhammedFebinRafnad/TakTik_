  import 'dart:developer';

import 'package:flutter/material.dart';
  import 'package:tak_tik/models/Home/add_task.dart';
  import 'package:tak_tik/services/apiservices.dart';
  import 'package:tak_tik/services/local_storage.dart';

  class AddTaskProv extends ChangeNotifier {
    bool isloading = false;
    Future<bool>addTask({
      required AddTaskModel task,
      required String description,
    })async{
      isloading=true;
      notifyListeners();
      try{
         final response=await Apiservices.post("tasks/", task.toJson());
        log("Api response:${response.data}");
        await LocalStorage.saveDescription(description);
        isloading=false;
        notifyListeners();
        return true;
      }catch(e){
          log("Error adding task: $e");
        isloading=false;
        notifyListeners();
        return false;
      }
    }
  }
