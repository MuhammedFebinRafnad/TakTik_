import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Taskaddinganim extends StatelessWidget {
  final double height;
  final double width;
  final String assetPath;

  const Taskaddinganim(
      {super.key,
      this.height = 50,
      this.width = 50,
      this.assetPath = 'assets/animation/addingTask.json'});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: height,
      width: width,
      child: Lottie.asset(assetPath),
    );
  }
}
