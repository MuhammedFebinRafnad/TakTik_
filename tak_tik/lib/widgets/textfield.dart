import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? labeltext;
  final String? helpertext;
  final String? errortext;
  final bool obscuretext;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)?validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool autoFocus;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool showCounter;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final Color? fillColor;
  final bool filled;
  final FocusNode? focusNode;
  const AppTextFormField({
    super.key,
    this.focusNode,
    this.validator,
    this.controller,
    required this.hintText,
    this.labeltext,
    this.helpertext,
    this.errortext,
    this.obscuretext = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSubmitted,
    this.autoFocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.showCounter = false,
    this.contentPadding,
    this.border,
    this.focusedBorder,
    this.errorBorder,
    this.fillColor,
    this.filled = true,
    
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      obscureText: obscuretext,
      validator:validator ,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      autofocus: autoFocus,
      maxLines: maxLines, 
      minLines: minLines,
      maxLength: maxLength,
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.black,
        height: 1.5,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        labelText: labeltext,
        helperText: helpertext,
        errorText: errortext,
        hintStyle: TextStyle(
          fontSize: 14.sp,
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(2),
        // ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2.2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2.2)),
            
      ),
    );
  }
}
