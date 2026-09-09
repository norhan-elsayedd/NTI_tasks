import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task2_todo_design/core/utilies/app_assests.dart';

class Home1Screen extends StatelessWidget {
  const Home1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Stack(
          children: [
            
            Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                top: 10.h,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Flag Image
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

                  // Hello + Name
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
            ),

            
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 40.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImages.no_task,
                      width: 400.w,
                      height: 350.h,
                      fit: BoxFit.contain,
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