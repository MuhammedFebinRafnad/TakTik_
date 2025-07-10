class AuthValidator{
  static String? emailValidator(String? value){
    if(value==null||value.isEmpty)return "Email is required";
    if((!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) ){
      return "Please Enter a valid email";
    }
    return null;
  }

  static String?passwordvalidator(String?value){
    if(value==null||value.isEmpty)return "Password is required";
    if(value.length<6)return "Password must be at least 6 characters";
    return null;
  } 
  static String?usernamevalidator(String?value){
    if(value==null||value.isEmpty)return "Username is required";
    if(value.length<3)return "Too short at least 3 characters";
    return null;
  }

  
}