import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tak_tik/models/Home/profile.dart';
import 'package:tak_tik/services/Auth.dart';
import 'package:tak_tik/services/apiservices.dart';

class ProfileProv with ChangeNotifier {
  ProfileModel? _profile;
  bool _isloading = false;
  String _profession='';
  String get profession=>_profession;
  ProfileModel? get profile => _profile;
  bool? get isloading => _isloading;

   Future<void> fetchprofile()async{
    _isloading=true;
    notifyListeners();
    await loadProfession();
    final token=await AuthService.getTokens();
    if(token==null){
      _isloading=false;
      notifyListeners();
      return;
    }
    try{
      final response=await Apiservices.get("/profile/",headers: {
            "Authorization": "Bearer $token",
      });
      if(response.statusCode==200){
        _profile=ProfileModel.fromJson(response.data);
        log("fetched prof ${response.statusCode}");
      }
    }catch(e){
      log("prf error $e");

    }finally{
    _isloading=false;
    notifyListeners();
    }
   }

Future<void>saveprofession(String newprofession)async{
  if(newprofession.trim().isEmpty)return;
  if(_profession!=newprofession){
    _profession=newprofession;
    final prefs=await SharedPreferences.getInstance();
    await prefs.setString("userprof",newprofession );
    notifyListeners();

  }
}
Future<void> loadProfession() async {
  final prefs = await SharedPreferences.getInstance();
  _profession = prefs.getString('userprof') ?? ''; 
  notifyListeners();
}




}
