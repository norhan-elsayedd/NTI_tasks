import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task2_todo_design/core/utilies/app_assests.dart';

class LanguageScreen extends StatelessWidget {
   LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),

          child: Column(
            children: [

              SizedBox(height: 20.h),

              SizedBox(
                height: 50.h,

                child: Stack(
                  alignment: Alignment.center,

                  children: [

                    Align(
                      alignment: Alignment.centerLeft,

                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },

                        child: SvgPicture.asset(
                          AppSvgs.Arrow2,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ),

                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 70.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Text(
                    'Language',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),


                  Row(
                    children: [

                      GestureDetector(
                        onTap: () {
                        },

                        child: Container(
                          width: 55.w,
                          height: 50.h,

                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 187, 185, 185),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5.r),
                              bottomLeft: Radius.circular(5.r),
                            ),
                          ),

                          child: Text(
                            'AR',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                        
                        },

                        child: Container(
                          width: 55.w,
                          height: 50.h,

                          alignment: Alignment.center,

                          decoration: BoxDecoration(
                            color: const Color(0xff339435),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.r),
                              bottomRight: Radius.circular(5.r),
                            ),
                          ),

                          child: Text(
                            'EN',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}