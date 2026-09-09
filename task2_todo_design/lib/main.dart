import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task2_todo_design/screens/add_task_screen.dart';
import 'package:task2_todo_design/screens/change_password_screen.dart';
import 'package:task2_todo_design/screens/home1_screen.dart';
import 'package:task2_todo_design/screens/home2_screen.dart';
import 'package:task2_todo_design/screens/language_screen.dart';
import 'package:task2_todo_design/screens/lets_start_screen.dart';
import 'package:task2_todo_design/screens/login_screen.dart';
import 'package:task2_todo_design/screens/profile_screen.dart';
import 'package:task2_todo_design/screens/register_screen.dart';
import 'package:task2_todo_design/screens/splash_screen.dart';
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
          ),
          home:
            // RegisterScreen(),
            //SplashScreen(),
            //LetsStartScreen(),
            //LoginScreen(),
            //Home1Screen(),
            //Home2Screen(),
            //ProfileScreen(),
            //UpddateProfileScreen(),
            //ChangePasswordScreen(),
            //LanguageScreen(),
            AddTaskScreen(),

        );
      },
    );
  }
}