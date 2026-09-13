// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2_todo_design/core/utilies/app_colors.dart';
import 'package:task2_todo_design/screens/tasks/presentation/view/add_task_screen.dart';
import 'package:task2_todo_design/screens/change_password_screen.dart';
import 'package:task2_todo_design/screens/tasks/presentation/view/edit_task_screen.dart';
import 'package:task2_todo_design/screens/home/presention/view/home1_screen.dart';
import 'package:task2_todo_design/screens/home/presention/view/home2_screen.dart';
import 'package:task2_todo_design/screens/language_screen.dart';
import 'package:task2_todo_design/screens/auth/presentation/lets_start_screen.dart';
import 'package:task2_todo_design/screens/auth/presentation/login_screen.dart';
import 'package:task2_todo_design/screens/profile_screen.dart';
import 'package:task2_todo_design/screens/auth/presentation/register_screen.dart';
import 'package:task2_todo_design/screens/auth/presentation/splash_screen.dart';
import 'package:task2_todo_design/screens/upddate_profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Lexend_Deca',
            scaffoldBackgroundColor: AppColors.background,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary
              
              )
          ),
          home:
            SplashScreen(),
            //EditTaskScreen(),
            
        );
      },
    );
  }
}