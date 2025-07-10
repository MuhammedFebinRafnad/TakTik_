import 'package:flutter/material.dart';
import 'package:tak_tik/core/styles/app_dec.dart';

class PriorityDropdown extends StatelessWidget {
  final String value;
  final void Function(String?) onchanged;

  const PriorityDropdown(
      {super.key, required this.value, required this.onchanged});

  @override
  Widget build(BuildContext context) {
    
    return DropdownButtonFormField<String>(
        value: value,
        decoration:
        InputDecoration( 

          // contentPadding: EdgeInsets.all(10.r),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade700)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue.shade700
            ),
          ),
          labelText: "Priority",
          labelStyle: AppDec.adTitle,
          isDense: true,
          border: OutlineInputBorder(),

        ),
        items: ["Low", "Medium", "High"]
            .map(
              (level) => DropdownMenuItem(value: level, child: Text(level ),),
            )
            .toList(),
        onChanged: onchanged,
        );
        
  }
}
