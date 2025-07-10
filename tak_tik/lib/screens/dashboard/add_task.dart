import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tak_tik/core/styles/app_dec.dart';
import 'package:tak_tik/models/Home/add_task.dart';
import 'package:tak_tik/providers/main/addtask_prov.dart';
import 'package:tak_tik/widgets/Text/text.dart';
import 'package:tak_tik/widgets/components/priority_Dropdown.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _titlecontrl = TextEditingController();
  final TextEditingController _desccontrl = TextEditingController();
  DateTime? _selecteddate;
  String _category = "Daily";
  String _priority = "Low";
  final bool _showPriorityoptions = false;
  void _selectedDate() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2070));
    if (picked != null && picked != _selecteddate) {
      setState(() {
        _selecteddate = picked;
      });
    }
  }

  final List<String> priorities = ["Low", "Medium", "High"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDec.maincolor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppDec.maincolor,
        title: Text(
          "Add task",
          style: GoogleFonts.poppins(textStyle: AppTextStyles.AppBartitle),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
              top: 40.h,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: AppDec.topRoundedWhite,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title", style: AppDec.adTitle),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextField(
                          controller: _titlecontrl,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.8, color: Colors.grey.shade300)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.8, color: Colors.blue.shade700)),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text("Due", style: AppDec.adTitle),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: _selectedDate,
                              child: Container(
                                height: 50.h,
                                width: 150.w,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.blue.shade700),
                                    borderRadius: BorderRadius.circular(6.r)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.calendar_month_outlined,
                                      size: 18.sp,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        _selecteddate == null
                                            ? "Select Date"
                                            : "${_selecteddate!.day}-${_selecteddate!.month}-${_selecteddate!.year}",
                                        style: GoogleFonts.poppins(
                                            fontSize: 13.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Expanded(
                              child: PriorityDropdown(
                                value: _priority,
                                onchanged: (newval) {
                                  setState(() {
                                    _priority = newval!;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Text(
                          "Category",
                          style: AppDec.adTitle,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () => setState(() {
                                  _category = "Daily";
                                }),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  decoration: BoxDecoration(
                                    color: _category == "Daily"
                                        ? Colors.blue
                                        : Colors.transparent,
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Daily Task",
                                      style: GoogleFonts.poppins(
                                          color: _category == "Daily"
                                              ? Colors.white
                                              : Colors.blue,
                                          fontSize: 14.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Expanded(
                                child: GestureDetector(
                              onTap: () => setState(() {
                                _category = "Priority";
                              }),
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                decoration: BoxDecoration(
                                    color: _category == "Priority"
                                        ? Colors.blue
                                        : Colors.transparent,
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: Center(
                                  child: Text(
                                    "Priority",
                                    style: GoogleFonts.poppins(
                                        color: _category == "Priority"
                                            ? Colors.white
                                            : Colors.blue,
                                        fontSize: 14.sp),
                                  ),
                                ),
                              ),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 13.h,
                        ),
                        Text(
                          "Description",
                          style: AppDec.adTitle,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TextField(
                          controller: _desccontrl,
                          maxLines: 6,
                          style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                          ),
                          decoration: InputDecoration(
                            hintText: "Enter Description...",
                            hintStyle: GoogleFonts.poppins(
                                color: Colors.grey, fontSize: 13.sp),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 14.h, horizontal: 12.w),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                          height: 50.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              final title = _titlecontrl.text.trim();
                              final description = _desccontrl.text.trim();
                              if (title.isEmpty || _selecteddate == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Title and dueDate are required")));
                                return;
                              }
                              final task = AddTaskModel(
                                  title: title,
                                  dueDate: _selecteddate!,
                                  category: _category,
                                  priority: _priority);
                              final provider = Provider.of<AddTaskProv>(context,
                                  listen: false);
                              final success = await provider.addTask(
                                  task: task, description: description);
                              if (success&&mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("Task Added Successfully")));
                                Navigator.pop(context,true);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Failed to add task")));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r))),
                            child: Text(
                              "Finish",
                              style: GoogleFonts.poppins(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
        ],
      )),
    );
  }
}
