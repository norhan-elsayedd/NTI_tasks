import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task2_todo_design/core/utilies/app_assests.dart';

class Home2Screen extends StatelessWidget {
  const Home2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Stack(
          children: [

            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 10.h,
                  bottom: 100.h,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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

                    SizedBox(height: 30.h),

                    // ================= TASKS =================
                    Row(
                      children: [

                        Text(
                          'Tasks',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),

                        SizedBox(width: 38.w),

                        Container(
                          width: 20.w,
                          height: 20.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xffDFF1E0),
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                          child: Text(
                            '4',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 51, 148, 55),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 25.h),

                    //FIRST TASK
                    Container(
                      width: double.infinity,
                      height: 105.h,

                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 14.w,
                        top: 12.h,
                        bottom: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffDFF1E0),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.16),
                            blurRadius: 12,
                            spreadRadius: 0,
                            offset: const Offset(0, 7),
                          ),
                        ],
                      ),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'My First Task',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w300,
                                    color: const Color.fromARGB(221, 58, 58, 58),
                                  ),
                                ),

                                SizedBox(height: 10.h),

                                Text(
                                  'Improve my English skills by\n'
                                  'trying to speek',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '29/07/2026',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(221, 58, 58, 58),
                                ),
                              ),

                              SizedBox(height: 3.h),

                              Text(
                                '05:30 PM',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(221, 58, 58, 58),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.h),

                    //SECOND TASK
                     Container(
                      width: double.infinity,
                      height: 105.h,

                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 14.w,
                        top: 12.h,
                        bottom: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffDFF1E0),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.16),
                            blurRadius: 12,
                            spreadRadius: 0,
                            offset: const Offset(0, 7),
                          ),
                        ],
                      ),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'My Second Task',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w300,
                                    color: const Color.fromARGB(221, 58, 58, 58),
                                  ),
                                ),

                                SizedBox(height: 10.h),

                                Text(
                                  ' Practice piano',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '7/08/2026',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(221, 58, 58, 58),
                                ),
                              ),

                              SizedBox(height: 3.h),

                              Text(
                                '09:00 PM',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(221, 58, 58, 58),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.h),

                      //THIRD TASK
                     Container(
                      width: double.infinity,
                      height: 105.h,

                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 14.w,
                        top: 12.h,
                        bottom: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffDFF1E0),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.16),
                            blurRadius: 12,
                            spreadRadius: 0,
                            offset: const Offset(0, 7),
                          ),
                        ],
                      ),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'My Third Task',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w300,
                                    color: const Color.fromARGB(221, 58, 58, 58),
                                  ),
                                ),

                                SizedBox(height: 10.h),

                                Text(
                                  'Go to the gym to improve my\n'
                                  'health and body shape',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '8/08/2026',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(221, 58, 58, 58),
                                ),
                              ),

                              SizedBox(height: 3.h),

                              Text(
                                '05:00 PM',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(221, 58, 58, 58),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.h),
                    
                    //FOURTH TASK
                     Container(
                      width: double.infinity,
                      height: 105.h,

                      padding: EdgeInsets.only(
                        left: 16.w,
                        right: 14.w,
                        top: 12.h,
                        bottom: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffDFF1E0),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.16),
                            blurRadius: 12,
                            spreadRadius: 0,
                            offset: const Offset(0, 7),
                          ),
                        ],
                      ),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'My Fourth Task',
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w300,
                                    color: const Color.fromARGB(221, 58, 58, 58),
                                  ),
                                ),

                                SizedBox(height: 10.h),

                                Text(
                                  'Do homework for the school',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    height: 1.2,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '11/08/2026',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(221, 58, 58, 58),
                                ),
                              ),

                              SizedBox(height: 3.h),

                              Text(
                                '05:50 PM',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(221, 58, 58, 58),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
            

            
            Positioned(
              right: 25.w,
              bottom: 25.h,
              child: GestureDetector(
                onTap: () {
                  
                },
                child: Container(
                  width: 50.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 51, 148, 55),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 51, 148, 55)
                            .withOpacity(0.35),
                        blurRadius: 12,
                        spreadRadius: 2,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      AppSvgs.Plus,
                      width: 25.w,
                      height: 25.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}