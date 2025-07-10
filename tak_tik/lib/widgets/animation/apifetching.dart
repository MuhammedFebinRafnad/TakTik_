
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Apifetching extends StatelessWidget {
  final double height;
  final double width;
  final String assetPath;

  const Apifetching({
    super.key,
    this.height = 300,
    this.width = 300,
    this.assetPath = 'assets/animation/loadingprof.json',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height.h, width: width.w, child: Lottie.asset(assetPath));
  }
}
