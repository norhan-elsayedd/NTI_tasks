import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task2_todo_design/core/utilies/app_assests.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 10.h,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ================= PROFILE HEADER =================

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      AppImages.flag,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 22.w),
                  Padding(
                    padding: EdgeInsets.only(top: 2.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello!',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),

                        SizedBox(height: 4.h),

                        Text(
                          'Norhan Elsayed',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35.h),

              // ================= PROFILE =================

              // ================= PROFILE =================

              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ProfileDetailsScreen(),
                  //   ),
                  // );
                },

                child: Container(
                  width: double.infinity,
                  height: 80.h,

                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ]
                  ),

                  child: Row(
                    children: [

                      SvgPicture.asset(
                        AppSvgs.profile,
                        width: 24.w,
                        height: 24.h,
                      ),

                      SizedBox(width: 28.w),

                      Expanded(
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      SvgPicture.asset(
                        AppSvgs.Arrow,
                        height: 21,
                        width: 21,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // ================= CHANGE PASSWORD =================

              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ChangePasswordScreen(),
                  //   ),
                  // );
                },

                child: Container(
                  width: double.infinity,
                  height: 80.h,

                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ]
                  ),

                  child: Row(
                    children: [

                      SvgPicture.asset(
                        AppSvgs.Lock,
                        width: 24.w,
                        height: 24.h,
                      ),

                      SizedBox(width: 28.w),

                      Expanded(
                        child: Text(
                          'Change Password',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      SvgPicture.asset(
                        AppSvgs.Arrow,
                        height: 21,
                        width: 21,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // ================= SETTINGS =================

              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SettingsScreen(),
                  //   ),
                  // );
                },

                child: Container(
                  width: double.infinity,
                  height: 80.h,

                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      )
                    ]
                  ),

                  child: Row(
                    children: [

                      SvgPicture.asset(
                        AppSvgs.Setting,
                        width: 24.w,
                        height: 24.h,
                      ),

                      SizedBox(width: 28.w),

                      Expanded(
                        child: Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                      ),

                      SvgPicture.asset(
                        AppSvgs.Arrow,
                        height: 21,
                        width: 21,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}