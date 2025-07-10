import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle subtitle =
      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, height: 3);
  static TextStyle bodytext =
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.normal);
      static TextStyle SnackBar=TextStyle(
    color: Colors.white,
    fontSize: 14.sp, 
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
      
  );
  static TextStyle AppBartitle=TextStyle(
    color: Colors.white,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold
  );
}

class CopyRight extends StatelessWidget {
  const CopyRight({super.key});
  @override
  Widget build(BuildContext context) {
    return Text(
      "© 2025 Taktik. All rights reserved.",
      style: TextStyle(
          fontSize: 12.sp, fontWeight: FontWeight.w300, color: Colors.grey),
    );
  }
}
