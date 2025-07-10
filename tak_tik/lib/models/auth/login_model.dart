class LoginModel {
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});

  Map<String, dynamic> tojson() {
    return {"username": email, "password": password, "grant_type": "password"};
  }
}
