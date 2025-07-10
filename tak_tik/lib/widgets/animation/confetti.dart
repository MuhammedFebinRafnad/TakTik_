import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiAnimation extends StatefulWidget {
  const ConfettiAnimation({super.key});

  @override
  State<ConfettiAnimation> createState() => _confettiAnimationState();
  
}

class _confettiAnimationState extends State<ConfettiAnimation> {
  final controller=ConfettiController();
  @override
  void initState() {
    super.initState();
    controller.play();
    Future.delayed(const Duration(seconds: 3),() {
      controller.stop();
    },);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(confettiController: controller,
      blastDirectionality: BlastDirectionality.explosive,
      numberOfParticles:20 ,
      shouldLoop: false,
      colors:const [
  Colors.green,
          Colors.blue,
          Colors.pink,
          Colors.orange,
          Colors.purple,
      ],),
    );
  }
}