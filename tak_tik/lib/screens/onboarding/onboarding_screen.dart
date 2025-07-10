import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tak_tik/screens/auth/login_page.dart';
import 'package:tak_tik/widgets/components/button.dart';
import 'package:tak_tik/widgets/Text/text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.08.sh,
                ),
              Lottie.asset("assets/animation/onbg.json"),
                Text(
                  "Easy Time Management",
                  style: AppTextStyles.subtitle,
                ),
               
                Padding(
                  padding: constraints.maxHeight <= 592
                      ? EdgeInsets.only(left: 8, right: 8, top: 5)
                      : EdgeInsets.only(left: 8, right: 8, bottom: 10),
                  child: Text(
                    "With management based on priority and daily tasks,  it will give you convenience in managing and determining the tasks that must be done first.",
                    style: AppTextStyles.bodytext,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                AppPrimaryButton(
                    text: "Get Started",
                    onpressed: () async {
                      final pref = await SharedPreferences.getInstance();
                      await pref.setBool("onboardingcompleted", true);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginpage(),
                          ));
                    })
              ],
            );
          }),
        ),
      ),
    );
  }
}
