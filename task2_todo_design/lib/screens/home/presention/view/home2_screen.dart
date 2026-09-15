import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2_todo_design/core/components/custom_svg.dart';
import 'package:task2_todo_design/core/helper/app_navigation.dart';

import 'package:task2_todo_design/core/utilies/app_assests.dart';
import 'package:task2_todo_design/core/utilies/app_colors.dart';
import 'package:task2_todo_design/core/utilies/app_paddings.dart';
import 'package:task2_todo_design/screens/auth/data/models/user_model.dart';
import 'package:task2_todo_design/screens/profile/presentation/view/profile_screen.dart';
import 'package:task2_todo_design/screens/tasks/presentation/view/add_task_screen.dart';
import 'package:task2_todo_design/screens/tasks/presentation/view/edit_task_screen.dart';
import 'package:task2_todo_design/screens/home/data/repo/home_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  UserModel ? currentUser;

  @override
  void initState() {
    getTasks();
    super.initState();
  }
  String? errorMsg;
  List? tasks;
  Future<void> getTasks()async{

    setState(() {
      errorMsg = null;
      tasks = null;
      isLoading = true;
    });
    HomeRepo repo = HomeRepo();
    var result = await repo.getTasks();
    result.fold(
        (String e){
          setState(() {
            errorMsg = e;
          });
        },
        (List t){
          setState(() {
            tasks = t;
          });
        }
    );
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                MyNavigator.goTo(
                  context,
                  toPage: const ProfileScreen(),
                );
              },
              child: CircleAvatar(
                backgroundImage: AssetImage(AppImages.flag),
                radius: 30.r,
              ),
            ),
            SizedBox(width: 16.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello!',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 12.sp,
                  color: AppColors.black
                ),),
                SizedBox(height: 4.h,),
                Text('${currentUser?.username}',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                      color: AppColors.black
                  ),),

              ],
            )
          ],
        )
      ),
      body: Padding(
        padding: AppPaddings.defaultPadding,
        child: isLoading?
            CircularProgressIndicator()
        :
            errorMsg != null?
                Center(child: Text(errorMsg!))
            :
                tasks!= null && tasks?.isNotEmpty == true?
        Column(
          children: [
            SizedBox(height: 30.h,),
            Row(
              children: [
                Text('Tasks',style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: AppColors.black
                ),),
                SizedBox(width: 20.w,),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  padding: REdgeInsets.symmetric(horizontal: 5),
                  child: Text('${tasks?.length}', style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400
                  ),),
                )
              ],
            ),
            SizedBox(height: 30.h,),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: ()async {
                    await MyNavigator.goTo(
                      context,
                      toPage: EditTaskScreen(
                        task: tasks![index],
                      ),
                    );
                    getTasks();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.primaryLight,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4.r,
                          spreadRadius: 0,
                          color: Colors.black.withValues(alpha: 0.25),
                        ),
                      ],
                    ),
                    padding: REdgeInsets.all(13),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tasks![index]['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: AppColors.grey,
                                ),
                              ),
                              SizedBox(height: 13.h),
                              Text(
                                tasks![index]['description'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.sp,
                                  color: AppColors.black,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          tasks![index]['created_at'],
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
                itemCount: tasks!.length,
              ),
            ),
          ],
        )
                    :
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('There are no tasks yet,\nPress the button\nTo add New Task ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                            color: AppColors.black

                          ),
                          textAlign: TextAlign.center,),
                          SizedBox(height: 60.h,),
                          CustomSvg(path: AppSvgs.empty,
                            width: 300.w,
                            height: 225.h,
                          )
                        ],
                      ),
                    )
                    

        ,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async{
            await MyNavigator.goTo(
              context, 
              toPage: AddTaskScreen(),
            );
            getTasks();
          },
        shape: CircleBorder(),
        backgroundColor: AppColors.primary,
        child: CustomSvg(path: AppSvgs.Plus),
      ),
    );
  }
}