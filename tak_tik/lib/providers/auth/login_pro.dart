import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tak_tik/models/auth/login_model.dart';
import 'package:tak_tik/services/Auth.dart';
import 'package:tak_tik/services/apiservices.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _messagefromapi;

  bool get isLoading => _isLoading;
  String? get messagefromapi => _messagefromapi;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    LoginModel loginModel =
        LoginModel(email: email.trim(), password: password.trim());

    try {
      final response = await Apiservices.postlogin(loginModel.tojson());
      _messagefromapi = null;
      log(response.data.toString());
      notifyListeners();
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        final token =response.data["access_token"];
       await AuthService.savetokens(token);
        _messagefromapi = "You’ve successfully logged in.";
      }
    } catch (e) {
      if (e is DioException && e.response != null) {
        final statuscode = e.response?.statusCode;
        final data = e.response?.data;

        log("Status : $statuscode");
        log("Data: $data");
        if (data is Map<String, dynamic> && data.containsKey("detail")) {
          _messagefromapi = data["detail"];
          notifyListeners();
        }
      } else {
        _messagefromapi = "Unexpected error occurred";
        notifyListeners();
      }

      // log(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
