import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWithLink extends StatelessWidget{
  final String normaltext;
  final String linktext;
  final VoidCallback ontap;
   const TextWithLink({
    super.key,
    required this.normaltext,
    required this.linktext,
    required this.ontap
   });
   @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: normaltext,
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(
            text: linktext,
            style: TextStyle(
              color: Colors.blue
            ),
           recognizer: TapGestureRecognizer()..onTap=ontap
          )

        ]
      )
    );
  }

}
