import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:task2_todo_design/core/utilies/app_assests.dart';

class UpddateProfileScreen extends StatelessWidget {
  UpddateProfileScreen({super.key});

  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Image
            Image.asset(
              AppImages.flag,
              width: double.infinity,
              height: 298.h,
              fit: BoxFit.cover,
            ),

            SizedBox(height: 40.h),

            // Username
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 80.h,
                child: TextFormField(
                  
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 40.h,),



            
          ],
        ),
      ),
    );
  }
}