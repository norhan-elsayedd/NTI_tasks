import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task2_todo_design/core/utilies/app_assests.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final oldpasswardController = TextEditingController();
  final newpasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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

            // OLD PASSWARD
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 80.h,
                child: TextFormField(
                  
                  controller: oldpasswardController,
                  decoration: InputDecoration(
                    hintText: 'Old passward',
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

            SizedBox(height: 25.h,),

            // New Password
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 80.h,
                child: TextFormField(
                  
                  controller: newpasswordController,
                  decoration: InputDecoration(
                    hintText: 'New passward',
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


            SizedBox(height: 25.h),

            // Confirm Password
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 80.h,
                child: TextFormField(
                  
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    hintText: 'Confirm passward',
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


            SizedBox(height: 30.h),

            // save Button
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: Container(
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
                child: ElevatedButton(
                  onPressed: () {
                    print(oldpasswardController.text);
                    print(newpasswordController.text);
                    print(confirmPasswordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 51, 148, 55),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 17.sp,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}