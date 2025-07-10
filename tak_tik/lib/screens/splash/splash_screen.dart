import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tak_tik/screens/auth/login_page.dart';
import 'package:tak_tik/screens/dashboard/home.dart';
import 'package:tak_tik/screens/onboarding/onboarding_screen.dart';
import 'package:tak_tik/widgets/Logo/Logowith_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _checkLogin() async {
    final pref = await SharedPreferences.getInstance();
    final isonboardingcompleted = pref.getBool("onboardingcompleted") ?? false;
    final token = pref.getString("auth_tokens");
    if (!isonboardingcompleted) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OnboardingScreen(),
          ));
    }else if(token!=null){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    }else{
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Loginpage(),
          ));
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), _checkLogin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogowithText(),
              Padding(
                padding: EdgeInsets.only(left: 130.w),
                child: Text(
                  "Plan Smart, Achieve More",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
