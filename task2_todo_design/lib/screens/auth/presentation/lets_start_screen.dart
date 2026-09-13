import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task2_todo_design/core/components/custom_btn.dart';
import 'package:task2_todo_design/core/utilies/app_assests.dart';
import 'package:task2_todo_design/screens/auth/presentation/login_screen.dart';

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

              CustomBtn(text: "Let’s Start", onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              })


            ],
          
          ),
        ),
      )
    );
  }
}