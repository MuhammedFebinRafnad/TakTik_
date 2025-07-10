import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tak_tik/core/styles/app_dec.dart';
import 'package:tak_tik/providers/main/displaytaskprov.dart';
import 'package:tak_tik/providers/main/profile_prov.dart';
import 'package:tak_tik/screens/dashboard/add_task.dart';
import 'package:tak_tik/screens/dashboard/profile/profile_screen.dart';
import 'package:tak_tik/utils/date_today.dart';
import 'package:tak_tik/widgets/Text/text.dart';
import 'package:tak_tik/widgets/animation/apifetching.dart';
import 'package:tak_tik/widgets/animation/empty_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileProv>(context, listen: false).fetchprofile();
      Provider.of<Displaytaskprov>(context, listen: false).fetchTask();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileprov = Provider.of<ProfileProv>(context);
    final displayTaskprov = Provider.of<Displaytaskprov>(context);
    final username = profileprov.profile?.name ?? "";
    if (profileprov.isloading == true) {
      return const Scaffold(
        body: Center(child: Apifetching()),
      );
    }
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppDec.secondorycolor,
          onPressed: () async {
            final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTask(),
                ));
            if (result == true) {
              Provider.of<Displaytaskprov>(context, listen: false).fetchTask();
            }
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 20.w, top: 30.h),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(CurrentDate.getformatedDate(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w100, fontSize: 20)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileScreen(),
                                  ));
                            },
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/Images/profwbg.jpg",
                              ),
                              radius: 25.r,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("Welcome $username",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 25)),
                    Text("Have a nice day!",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15)),
                    SizedBox(
                      height: 40.h,
                    ),
                    if (displayTaskprov.priorityTask.isNotEmpty) ...[
                      Text(
                        "My Priority Task",
                        style: AppTextStyles.subtitle,
                      ),
                      SizedBox(
                        height: 140.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: displayTaskprov.priorityTask.length,
                          itemBuilder: (context, index) {
                            final EachTask =
                                displayTaskprov.priorityTask[index];
                            return Padding(
                              padding: EdgeInsets.all(10.r),
                              child: Container(
                                width: 180.w,
                                padding: EdgeInsets.all(12.r),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(EachTask.title,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18)),
                                    const Spacer(),
                                    Text(
                                        "Due: ${EachTask.dueDate.toLocal().toString().split(' ')[0]}",
                                        style: const TextStyle(
                                            color: Colors.white70)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                    SizedBox(
                      height: 10.h,
                    ),
                    if (displayTaskprov.dailyTask.isNotEmpty) ...[
                      Text(
                        "Daily Task",
                        style: AppTextStyles.subtitle,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: displayTaskprov.dailyTask.length,
                        itemBuilder: (context, index) {
                          final EachTask = displayTaskprov.dailyTask[index];
                          return ListTile(
                            leading: const Icon(Icons.circle_outlined),
                            title: Text(
                              EachTask.title,
                              style: AppTextStyles.bodytext,
                            ),
                            subtitle: Text(
                                "Due: ${EachTask.dueDate.toLocal().toString().split(' ')[0]}"),
                          );
                        },
                      ),
                    ],
                    if (displayTaskprov.priorityTask.isEmpty &&
                        displayTaskprov.dailyTask.isEmpty)
                      Center(
                        child: Column(
                          children: [
                            EmptyTask(),
                            SizedBox(height: 40.h),
                            Text("Organize your work — add a task",
                                style: AppTextStyles.bodytext),
                          ],
                        ),
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
