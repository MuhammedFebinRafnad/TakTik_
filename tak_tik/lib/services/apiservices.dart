import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tak_tik/services/Auth.dart';

class Apiservices {
  static final dio = Dio(
    BaseOptions(
        baseUrl: "https://simple-tasks-api-lkab.onrender.com/",
        connectTimeout: Duration(seconds: 10),
        headers: {
          "contentType": "application/json",
        }),
  );

  static Future<Response> post(
    String endpoint,
    dynamic datatoAPI,
  ) async {
    final token = await AuthService.getTokens();
    log("post to $endpoint");
    log("post to $datatoAPI");
    log("post to $token");

    return await dio.post(endpoint,
        data: datatoAPI,
        options: Options(headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        }));
  }

  static Future<Response> postlogin(dynamic loginData) async {
    return await dio.post("login/",
        data: loginData,
        options: Options(
          contentType: "application/x-www-form-urlencoded",
        ));
  }

  static Future<Response> get(String endpoint,
      {Map<String, dynamic>? headers}) async {
    return await dio.get(
      endpoint,
      options: Options(
        headers: headers,
      ),
    );
  }
}
