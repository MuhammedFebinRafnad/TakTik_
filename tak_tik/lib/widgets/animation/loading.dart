import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingAnimation extends StatelessWidget {
  final double height;
  final double width;
  final String assetPath;

  const LoadingAnimation({
    super.key,
    this.height = 100,
    this.width = 100,
    this.assetPath = 'assets/animation/Loading.json',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height.h, width: width.w, child: Lottie.asset(assetPath));
  }
}
