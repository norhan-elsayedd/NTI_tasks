import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import 'package:task2_todo_design/core/utilies/app_assests.dart';
import 'package:task2_todo_design/screens/auth/data/models/user_model.dart';
import 'package:task2_todo_design/screens/profile/data/repo/update_profile_repo.dart';

class UpddateProfileScreen extends StatefulWidget {
  const UpddateProfileScreen({super.key});

  @override
  State<UpddateProfileScreen> createState() =>
      _UpddateProfileScreenState();
}

class _UpddateProfileScreenState
    extends State<UpddateProfileScreen> {

  final usernameController = TextEditingController();

  XFile? image;

  bool isLoading = false;

  
  

  // ================= PICK IMAGE =================

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  // ================= UPDATE PROFILE =================

  Future<void> updateProfile() async {
    if (usernameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter username'),
        ),
      );

      return;
    }

    if (image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please pick an image'),
        ),
      );

      return;
    }

    setState(() {
      isLoading = true;
    });

    UpdateProfileRepo repo = UpdateProfileRepo();

    var result = await repo.updateProfile(
      username: usernameController.text.trim(),
      image: File(image!.path),
    );

    if (!mounted) return;

    result.fold(
      (errorMsg) {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMsg),
            backgroundColor: Colors.red,
          ),
        );
      },

      (message) {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pop(context);
      },
    );

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }
  

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ================= IMAGE =================

            Stack(
              children: [
                GestureDetector(
                  onTap: pickImage,

                  child: image != null
                      ? Image.file(
                          File(image!.path),
                          width: double.infinity,
                          height: 298.h,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          AppImages.flag,
                          width: double.infinity,
                          height: 298.h,
                          fit: BoxFit.cover,
                        ),
                ),

                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20.w,
                      top: 10.h,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),

            // ================= USERNAME =================

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

            SizedBox(height: 40.h),

            // ================= UPDATE BUTTON =================

            Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),

              child: Container(
                width: double.infinity,
                height: 60.h,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),

                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(
                        255,
                        51,
                        148,
                        55,
                      ).withValues(alpha: 0.55),

                      blurRadius: 6,
                      spreadRadius: 1,

                      offset: const Offset(0, 9),
                    ),
                  ],
                ),

                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : updateProfile,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                      255,
                      51,
                      148,
                      55,
                    ),

                    foregroundColor: Colors.white,

                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),

                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          'Update Profile',
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