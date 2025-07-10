import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogowithText extends StatelessWidget {
  const LogowithText({super.key});


  @override
  Widget build(BuildContext context) {
    return  Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/Images/Vector.png",height: 0.07.sh,),
              //  SizedBox(
              //   width: 0.02.sh,
              // ),
              Text(
                "Taktik",
                style: TextStyle(
                    color: Color(0xF0077FFF),
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold,
                    fontSize: 0.05.sh,
                    height: 1.h),
              ),
            ],
    );
  }
}