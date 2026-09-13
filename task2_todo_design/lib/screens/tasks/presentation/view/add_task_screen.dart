import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:task2_todo_design/core/utilies/app_assests.dart';
import 'package:task2_todo_design/screens/tasks/data/model/task_model.dart';
import 'package:task2_todo_design/screens/tasks/data/repo/add_task_repo.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();

  final descriptionController = TextEditingController();

  final groupController = TextEditingController();

  final endTimeController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // ================= IMAGE =================

  XFile? image;

  bool isLoading = false;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    groupController.dispose();
    endTimeController.dispose();

    super.dispose();
  }

  // ================= PICK IMAGE =================

  Future<void> pickImage() async {
    final picker = ImagePicker();

    XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  // ================= DATE & TIME =================

  Future<void> selectDateAndTime() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (date == null) {
      return;
    }

    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time == null) {
      return;
    }

    setState(() {
      selectedDate = date;
      selectedTime = time;

      endTimeController.text =
          '${date.day}/${date.month}/${date.year}    ${time.format(context)}';
    });
  }

  // ================= ADD TASK =================

  Future<void> addTask() async {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter title and description'),
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

    TaskModel task = TaskModel(
      title: titleController.text,
      description: descriptionController.text,
    );

    AddTaskRepo repo = AddTaskRepo();

    var result = await repo.addTask(
      task: task,
      image: File(image!.path),
    );

    result.fold(
      // ================= ERROR =================

      (errorMsg) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              errorMsg,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
          ),
        );
      },

      // ================= SUCCESS =================

      (msg) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              msg,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color.fromARGB(
              255,
              51,
              148,
              55,
            ),
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

                child: Stack(
                  alignment: Alignment.bottomCenter,

                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.r),

                      child: image != null
                          ? Image.file(
                              File(image!.path),
                              width: double.infinity,
                              height: 250.h,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              AppImages.flag,
                              width: double.infinity,
                              height: 250.h,
                              fit: BoxFit.cover,
                            ),
                    ),

                    // ================= PICK IMAGE BUTTON =================

                    Padding(
                      padding: REdgeInsets.only(bottom: 10),

                      child: ElevatedButton(
                        onPressed: pickImage,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black.withValues(
                            alpha: 0.2,
                          ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                        ),

                        child: Text(
                          'Pick Image',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                      if (value != null) {
                        groupController.text = value;
                      }
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

                    readOnly: true,

                    onTap: () {
                      selectDateAndTime();
                    },

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

              // ================= ADD TASK BUTTON =================

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
                    onPressed: isLoading ? null : addTask,

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
                        ? SizedBox(
                            width: 25.w,
                            height: 25.h,

                            child: const CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Text(
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