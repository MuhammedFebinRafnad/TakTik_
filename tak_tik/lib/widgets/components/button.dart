import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tak_tik/core/styles/app_dec.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final Future<void> Function()? onpressed;
  final bool isLoading;

  const AppPrimaryButton(
      {super.key,
      required this.text,
      required this.onpressed,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading
          ? null
          : () async {
              await onpressed!();
            },
      style: ElevatedButton.styleFrom(
          backgroundColor: AppDec.maincolor,
          padding: EdgeInsets.symmetric(horizontal: 0.3.sw, vertical: 0.1.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: isLoading
          ? SizedBox(
              height: 20.h,
              width: 20.w,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
                 valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              text,
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
    );
  }
}
