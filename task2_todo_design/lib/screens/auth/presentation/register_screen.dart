import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task2_todo_design/core/utilies/app_assests.dart';
import 'package:task2_todo_design/core/utilies/app_colors.dart';
import 'package:task2_todo_design/core/utilies/app_paddings.dart';
import 'package:task2_todo_design/screens/auth/data/repo/auth_repo.dart';

import '../../../../core/components/custom_btn.dart';
import '../../../../core/components/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmController = TextEditingController();
  bool isPasswordSecure = true;
  bool isPasswordConfirmSecure = true;
  bool isLoading = false;
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // image
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20.r),
                    bottomLeft: Radius.circular(20.r),
                  ),
                  child: image !=null?
                      Image.file(File(image!.path),
                        width: double.infinity,
                        height: 293.h,
                        fit: BoxFit.cover,)
                  :
                  Image.asset(
                    AppImages.flag,
                    width: double.infinity,
                    height: 293.h,
                    fit: BoxFit.cover,
                  ),
                ),

                // pick image btn
                Padding(
                  padding: REdgeInsets.only(bottom: 10.0),
                  child: ElevatedButton(
                    onPressed: ()async{
                      final picker = ImagePicker();
                      image = await picker.pickImage(source: ImageSource.gallery);

                      setState(() {

                      });

                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black.withValues(
                      alpha: 0.2
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r)
                    )
                  ), child: Text('Pick Image',style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400
                  ),),),
                ),
              ],
            ),


            Padding(
              padding: AppPaddings.defaultPadding,
              child: Column(
                children: [
                  SizedBox(height: 23.h),
                  CustomTextField(
                    controller: usernameController,
                    hint: 'Username',
                    prefixIconPath: AppSvgs.profile,
                  ),

                  SizedBox(height: 10.h),
                  CustomTextField(
                    controller: passwordController,
                    hint: 'Password',
                    prefixIconPath: AppSvgs.Password,
                    suffixIconPath: isPasswordSecure
                        ? AppSvgs.lockOpen
                        : AppSvgs.unlock,
                    onSuffixPressed: () {
                      setState(() {
                        isPasswordSecure = !isPasswordSecure;
                      });
                    },
                    obscureText: isPasswordSecure,
                  ),
                  SizedBox(height: 10.h),
                  CustomTextField(
                    controller: passwordConfirmController,
                    hint: 'Confirm Password',
                    prefixIconPath: AppSvgs.Password,
                    suffixIconPath: isPasswordConfirmSecure
                        ? AppSvgs.lockOpen
                        : AppSvgs.unlock,
                    onSuffixPressed: () {
                      setState(() {
                        isPasswordConfirmSecure = !isPasswordConfirmSecure;
                      });
                    },
                    obscureText: isPasswordConfirmSecure,
                  ),

                  SizedBox(height: 23.h),
                  if (!isLoading)
                    CustomBtn(
                      text: 'Register',
                      onPressed: () async {
                        AuthRepo repo = AuthRepo();
                        setState(() {
                          isLoading = true;
                        });
                        var result = await repo.register(
                          username: usernameController.text,
                          password: passwordController.text,
                          imagePath: image?.path
                        );
                        result.fold(
                          // left
                                (errorMsg) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    errorMsg,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            },
                            // right
                                (msg){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(msg,
                                    style: TextStyle(color: Colors.white),),
                                    backgroundColor: AppColors.primary,)
                              );
                              Navigator.pop(context);
                            }

                        );
                        setState(() {
                          isLoading = false;
                        });
                      },
                    ),
                  if (isLoading) CircularProgressIndicator(),
                  SizedBox(height: 40.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Have An Account? ", style: TextStyle(
                          color: AppColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w200
                      ),),
                      SizedBox(width: 15,),
                      TextButton(onPressed: ()=> Navigator.pop(context),
                          child: Text('Login', style: TextStyle(
                              color: AppColors.black,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400
                          ),))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}