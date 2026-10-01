

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:task2_todo_design/core/components/custom_svg.dart';
import 'package:task2_todo_design/core/helper/app_navigation.dart';
import 'package:task2_todo_design/core/utilies/app_assests.dart';
import 'package:task2_todo_design/core/utilies/app_colors.dart';
import 'package:task2_todo_design/core/utilies/app_paddings.dart';

import 'package:task2_todo_design/screens/auth/data/models/user_model.dart';
import 'package:task2_todo_design/screens/home/data/repo/home_repo.dart';
import 'package:task2_todo_design/screens/home/presention/view/home1_screen.dart';
import 'package:task2_todo_design/screens/profile/presentation/view/profile_screen.dart';
import 'package:task2_todo_design/screens/tasks/presentation/view/add_task_screen.dart';
import 'package:task2_todo_design/screens/tasks/presentation/view/edit_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  String? errorMsg;
  List? tasks;
  UserModel? currentUser;

  @override
  void initState() {
    super.initState();
    getTasks();
  }

  Future<void> getTasks() async {
    setState(() {
      errorMsg = null;
      tasks = null;
      isLoading = true;
    });

    final result = await HomeRepo().getTasks();

    result.fold(
      (error) {
        setState(() {
          errorMsg = error;
        });
      },
      (data) {
        setState(() {
          tasks = data;
        });
      },
    );

    setState(() {
      isLoading = false;
    });
  }

  Future<void> openEmptyHome() async {
    final result = await MyNavigator.goTo(
      context,
      toPage: const Home1Screen(),
    );

    if (result == true) {
      getTasks();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoading &&
        errorMsg == null &&
        tasks != null &&
        tasks!.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          openEmptyHome();
        }
      });
    }

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

            SizedBox(width: 16.w),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello!',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp,
                    color: AppColors.black,
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  currentUser?.username ?? 'Norhan Elsayed',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      body: Padding(
        padding: AppPaddings.defaultPadding,
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : errorMsg != null
                ? Center(
                    child: Text(errorMsg!),
                  )
                : tasks != null && tasks!.isNotEmpty
                    ? Column(
                        children: [
                          SizedBox(height: 30.h),

                          Row(
                            children: [
                              Text(
                                'Tasks',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.black,
                                ),
                              ),

                              SizedBox(width: 20.w),

                              Container(
                                padding: REdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryLight,
                                  borderRadius:
                                      BorderRadius.circular(5.r),
                                ),
                                child: Text(
                                  '${tasks!.length}',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 30.h),

                          Expanded(
                            child: ListView.separated(
                              itemCount: tasks!.length,

                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    await MyNavigator.goTo(
                                      context,
                                      toPage: EditTaskScreen(
                                        task: tasks![index],
                                      ),
                                    );

                                    getTasks();
                                  },

                                  child: Container(
                                    padding: REdgeInsets.all(13),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20.r),
                                      color: AppColors.primaryLight,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 4),
                                          blurRadius: 4.r,
                                          color: Colors.black
                                              .withValues(
                                            alpha: 0.25,
                                          ),
                                        ),
                                      ],
                                    ),

                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                tasks![index]['title'],
                                                style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w400,
                                                  fontSize: 12.sp,
                                                  color:
                                                      AppColors.grey,
                                                ),
                                              ),

                                              SizedBox(height: 13.h),

                                              Text(
                                                tasks![index]
                                                    ['description'],
                                                maxLines: 2,
                                                overflow:
                                                    TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.w300,
                                                  fontSize: 14.sp,
                                                  color:
                                                      AppColors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(width: 5.w),

                                        Text(
                                          tasks![index]['created_at'],
                                          style: TextStyle(
                                            fontWeight:
                                                FontWeight.w400,
                                            fontSize: 12.sp,
                                            color: AppColors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },

                              separatorBuilder: (_, __) {
                                return SizedBox(height: 20.h);
                              },
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
      ),

      floatingActionButton: tasks != null && tasks!.isNotEmpty
          ? FloatingActionButton(
              onPressed: () async {
                final result = await MyNavigator.goTo(
                  context,
                  toPage: const AddTaskScreen(),
                );

                if (result == true) {
                  getTasks();
                } else {
                  getTasks();
                }
              },
              shape: const CircleBorder(),
              backgroundColor: AppColors.primary,
              child: CustomSvg(
                path: AppSvgs.Plus,
              ),
            )
          : null,
    );
  }
}

