import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task2_todo_design/core/utilies/app_assests.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
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

            SizedBox(height: 10.h),

            // Username
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: 'Username',

                  prefixIcon: Padding(
                    padding: EdgeInsets.all(14.w),
                    child: SvgPicture.asset(
                      AppSvgs.profile,
                    ),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15.h),

            // Password
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: 'Password',

                  prefixIcon: Padding(
                    padding: EdgeInsets.all(14.w),
                    child: SvgPicture.asset(
                      AppSvgs.Password,
                    ),
                  ),

                  suffixIcon: const Icon(
                    Icons.lock_outline,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15.h),

            // Confirm Password
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: 'Confirm Password',

                  prefixIcon: Padding(
                    padding: EdgeInsets.all(14.w),
                    child: SvgPicture.asset(
                      AppSvgs.Password,
                    ),
                  ),

                  suffixIcon: const Icon(
                    Icons.lock_outline,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 25.h),

            // Register Button
            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 55.h,
                child: ElevatedButton(
                  onPressed: () {
                    print(usernameController.text);
                    print(passwordController.text);
                    print(confirmPasswordController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 17.sp,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}