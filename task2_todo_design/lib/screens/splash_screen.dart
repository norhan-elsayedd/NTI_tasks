import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task2_todo_design/core/utilies/app_assests.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
          SvgPicture.asset(
            AppSvgs.logo,
            width: 400.w,
            height: 400.h,
          )
      ),
    );
  }
}