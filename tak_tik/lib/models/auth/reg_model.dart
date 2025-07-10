  class registermodel {
    String? name;
    String? email;
    String? password;
    registermodel(
        {required this.name, required this.email, required this.password});

    Map<String, dynamic> tojson() {
      return {"name": name, "email": email, "password": password};
    }
  }
