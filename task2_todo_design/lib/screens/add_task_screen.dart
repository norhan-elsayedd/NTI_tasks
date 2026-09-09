import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task2_todo_design/core/utilies/app_assests.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});

    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final groupController = TextEditingController();
    final endTimeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // ================= HEADER =================

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 5.h,
                ),

                child: SizedBox(
                  height: 45.h,

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
                            width: 22.w,
                            height: 22.h,
                          ),
                        ),
                      ),

                      Text(
                        'Add Task',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              // ================= IMAGE =================

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),

                  child: Image.asset(
                    AppImages.flag,
                    width: double.infinity,
                    height: 250.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(height: 35.h),

              // ================= TITLE =================

              Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 80.h,
                child: TextFormField(
                  
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                     hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14.sp,
                      ),
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

              SizedBox(height: 15.h),

              // ================= DESCRIPTION =================

              Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                minLines: 1,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: 'Description',
                   hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14.sp,
                    ),
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

              SizedBox(height: 15.h),

              // ================= GROUP DROPDOWN =================

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),

                child: SizedBox(
                  height: 75.h,

                  child: DropdownButtonFormField<String>(
                    isExpanded: true,

                    decoration: InputDecoration(
                      hintText: 'Group',

                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14.sp,
                      ),

                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
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

                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 30.sp,
                      color: Colors.black,
                    ),

                    dropdownColor: Colors.white,

                    borderRadius: BorderRadius.circular(20.r),

                    elevation: 3,

                    // ================= DROPDOWN ITEMS =================

                    items: [

                      // HOME
                      DropdownMenuItem<String>(
                        value: 'Home',

                        child: Row(
                          children: [

                            Image.asset(
                              AppImages.home,
                              width: 34.w,
                              height: 34.h,
                            ),

                            SizedBox(width: 18.w),

                            Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // PERSONAL
                      DropdownMenuItem<String>(
                        value: 'Personal',

                        child: Row(
                          children: [

                            Image.asset(
                              AppImages.personal,
                              width: 34.w,
                              height: 34.h,
                            ),

                            SizedBox(width: 18.w),

                            Text(
                              'Personal',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // WORK
                      DropdownMenuItem<String>(
                        value: 'Work',

                        child: Row(
                          children: [

                            Image.asset(
                              AppImages.work,
                              width: 34.w,
                              height: 34.h,
                            ),

                            SizedBox(width: 18.w),

                            Text(
                              'Work',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    onChanged: (value) {
                    
                    },
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              // ================= END TIME =================

              Padding(
              padding: REdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 80.h,
                child: TextFormField(
                  
                  controller: endTimeController,
                  decoration: InputDecoration(
                    hintText: 'End Time',
                     hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 14.sp,
                      ),
                    prefixIcon: Padding(
                    padding: EdgeInsets.all(14.w),
                    child: SvgPicture.asset(
                      AppSvgs.calender,
                      height: 24.h,
                      width: 24.w,
                    ),
                  ),
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


            SizedBox(height: 15.h),

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
                    print(titleController.text);
                    print(descriptionController.text);
                    print(groupController.text);
                    print(endTimeController.text);
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
                    'Add Task',
                    style: TextStyle(
                      fontSize: 17.sp,
                    ),
                  ),
                ),
              ),
            ),


          ],
          ),
        ),
      ),
    );
  }
}