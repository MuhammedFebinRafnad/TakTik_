import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class EmptyTask extends StatelessWidget {
  final double height;
  final double width;
  final String assetPath;
  const EmptyTask(
      {super.key,
      this.height = 250,
      this.width = 250,   
      this.assetPath = "assets/animation/emptytask.json"});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height.h, width: width.w, child: Lottie.asset(assetPath));
  }
}
