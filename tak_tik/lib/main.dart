import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tak_tik/providers/auth/login_pro.dart';
import 'package:tak_tik/providers/auth/register_pro.dart';
import 'package:tak_tik/providers/main/addtask_prov.dart';
import 'package:tak_tik/providers/main/displaytaskprov.dart';
import 'package:tak_tik/providers/main/profile_prov.dart';
import 'package:tak_tik/screens/splash/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterProvider(),),
        ChangeNotifierProvider(create: (context) => LoginProvider(),),
        ChangeNotifierProvider(create: (context) => ProfileProv(),),
        ChangeNotifierProvider(create: (context) => AddTaskProv(),),
        ChangeNotifierProvider(create: (context) => Displaytaskprov(),)
      ],
    child: const myApp()));
}
 class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),  
    );
  }
}