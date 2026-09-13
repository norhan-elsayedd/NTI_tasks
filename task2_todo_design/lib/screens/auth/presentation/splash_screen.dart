import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task2_todo_design/core/helper/app_navigation.dart';
import 'package:task2_todo_design/core/utilies/app_assests.dart';
import 'package:task2_todo_design/screens/auth/presentation/lets_start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      MyNavigator.goTo(
        context,
        toPage: const LetsStartScreen(),
        type: NavigatorType.pushReplacement,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppSvgs.logo,
          width: 400.w,
          height: 400.h,
        ),
      ),
    );
  }
}