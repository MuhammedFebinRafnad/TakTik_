import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class RegBg extends StatelessWidget {
  final double height;
  final double width;
  final String assetPath;
  const RegBg(
      {super.key,
      this.height = 150,
      this.width = 150,   
      this.assetPath = "assets/animation/regbg.json"});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height.h, width: width.w, child: Lottie.asset(assetPath));
  }
}
