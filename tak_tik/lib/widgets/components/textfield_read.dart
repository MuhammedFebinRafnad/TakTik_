import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? hintText;
  final bool readonly;
  final TextInputType? type;

  const LabeledTextField({
    super.key,
    this.hintText,
    this.type,
    required this.label,
    required this.controller,
    this.readonly=false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600,color:Color(0xFF006EE9) ),
        ),
        SizedBox(height: 6),
        TextField(
          keyboardType:type,
          readOnly: readonly,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
