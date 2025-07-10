import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDec {
  AppDec._();
 static Color get maincolor=>Color(0xFF006EE9);
 static Color get secondorycolor=> Colors.blueAccent.shade100;
 static TextStyle get adTitle=>   GoogleFonts.poppins(fontWeight: FontWeight.w600, color:Colors.blueAccent.shade100);
  static BoxDecoration get topRoundedWhite=>BoxDecoration(
    color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(35.r))
  );
}