import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final String selectedcategory;
  final VoidCallback ontap;
  const CategoryButton(
      {super.key,
      required this.label,
      required this.selectedcategory,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    final isSelected=selectedcategory==label;

    return Expanded(child: GestureDetector(
      onTap: ontap,
      child: Container(
         padding: const EdgeInsets.symmetric(vertical: 14),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            gradient: isSelected ? const LinearGradient(colors: [Color(0xFF007BFF),Color(0xFF0056D2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
            )
            :null,
            color: isSelected? null:Colors.white,
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(label),
          ),
      ),
    ));
  }
}
