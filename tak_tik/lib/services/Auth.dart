  import 'package:shared_preferences/shared_preferences.dart';

  class AuthService{
    static Future<void>savetokens(String token)async{
      final prefs=await SharedPreferences.getInstance();
      await prefs.setString("auth_tokens", token);
    }
    static Future<String?>getTokens()async{
      final prefs=await SharedPreferences.getInstance();
      return prefs.getString("auth_tokens");
    }
    static Future<void>logout()async{
      final prefs=await SharedPreferences.getInstance();
      await prefs.remove("auth_tokens");
    }

  }