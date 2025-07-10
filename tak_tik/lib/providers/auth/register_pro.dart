import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tak_tik/models/auth/reg_model.dart';
import 'package:tak_tik/services/apiservices.dart';

class RegisterProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _messagefromapi;

  bool get isLoading => _isLoading;
  String? get messagefromapi => _messagefromapi;

  Future<void> register(String name, String email, String password) async {
    _isLoading = true;
    notifyListeners();
    registermodel regmodel = registermodel(
        name: name.trim(), email: email.trim(), password: password.trim());
    try {
      final response = await Apiservices.post("register/", regmodel.tojson());
      log(response.statusCode.toString());
      log(response.data.toString());
      notifyListeners();
      if (response.statusCode == 200 || response.statusCode == 201) {
  _messagefromapi = "Registration successful";
} else {
  // Handle different non-200 status codes
  switch (response.statusCode) {
    case 400:
      _messagefromapi = "Invalid input. Please check your data.";
      break;
    case 401:
      _messagefromapi = "Unauthorized. Please log in.";
      break;
    case 403:
      _messagefromapi = "Forbidden. You don’t have permission.";
      break;
    case 404:
      _messagefromapi = "Not found. Check the API endpoint or data.";
      break;
    case 409:
      _messagefromapi = "Conflict. Email or username may already exist.";
      break;
    case 500:
      _messagefromapi = "Server error. Please try again later.";
      break;
    default:
      _messagefromapi = response.data['detail'] ?? "Registration failed";
  }
}
    } catch (e) {
      if(e is TimeoutException){
      _messagefromapi = "the req time out";
      _isLoading = false;
        notifyListeners();
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
