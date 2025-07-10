import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String daysleft;
  final double progress;
  final Color color;
  final String task;

  const TaskCard(
      {super.key,
      required this.title,
      required this.daysleft,
      required this.progress,
      required this.color,
      required this.task});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 150.w,
        margin: EdgeInsets.only(right: 16.w),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Center(
              child: Text(
                task,
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
            Spacer(),
            Text(
              title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                SizedBox(width: 10.w,),
                Text("30%")
              ],
            ),
          ],
        ),
      ),
      Positioned(
          top: 10.h,
          right: 20.w,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Text(daysleft),
          ))
    ]);
  }
}
