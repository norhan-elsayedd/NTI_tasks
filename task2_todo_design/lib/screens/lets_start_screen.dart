import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task2_todo_design/core/utilies/app_assests.dart';

class LetsStartScreen extends StatelessWidget {
  const LetsStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                AppSvgs.start,
                width: 300.w,
                height: 340.h,
              ),
              SizedBox(height: 50.h,),
              Text("Welcome To",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text("Do It !",
                style: TextStyle(
                  fontSize: 24.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              
              SizedBox(height: 35.h,),

              Text("Ready to conquer your tasks? Let's Do",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color.fromARGB(255, 75, 75, 75), 
                  fontWeight: FontWeight.w500
                ),
              ),
              Text("It together.",
                style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color.fromARGB(255, 75, 75, 75), 
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 70.h,),
              
              //const Spacer(),

              Container(
                width: double.infinity,
                height: 60.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 51, 148, 55).withValues(alpha: 0.55),
                      blurRadius: 6,
                      spreadRadius: 1,
                      offset: const Offset(0, 9),
                    ),
                  ],
                ),
                child:  ElevatedButton(
                  onPressed:(){

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 51, 148, 55),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                 child: Text("Let’s Start",
                  style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w300,
                ),
                 ),
                ),
              )


            ],
          
          ),
        ),
      )
    );
  }
}