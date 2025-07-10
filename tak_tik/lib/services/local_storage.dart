import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future <void>saveDescription(String desc)async{
    final prefs=await SharedPreferences.getInstance();
    await prefs.setString("task_description",desc);

  }
  static Future<String?>getDescription()async{
    final prefs=await SharedPreferences.getInstance();
    return prefs.getString("task_description");
  }
}
