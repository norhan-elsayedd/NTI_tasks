import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:task2_todo_design/core/utilies/app_assests.dart';
import 'package:task2_todo_design/core/utilies/app_colors.dart';

import 'package:task2_todo_design/screens/tasks/data/model/task_model.dart';
import 'package:task2_todo_design/screens/tasks/data/repo/delete_task_repo.dart';
import 'package:task2_todo_design/screens/tasks/data/repo/edit_task_repo.dart';

import 'package:task2_todo_design/screens/tasks/presentation/view/done_task_screen.dart';

class EditTaskScreen extends StatefulWidget {
  final Map task;

  const EditTaskScreen({
    super.key,
    required this.task,
  });

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TextEditingController _titleController =
      TextEditingController();

  final TextEditingController _descriptionController =
      TextEditingController();

  final groupController = TextEditingController();

  final endTimeController = TextEditingController();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  // ================= IMAGE =================

  XFile? image;

  // ================= LOADING =================

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _titleController.text = widget.task['title'] ?? '';
    _descriptionController.text =
        widget.task['description'] ?? '';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    groupController.dispose();
    endTimeController.dispose();

    super.dispose();
  }

  //=============delete function================

  Future<void> deleteTask() async {
    setState(() {
      isLoading = true;
    });

    DeleteTaskRepo repo = DeleteTaskRepo();

    var result = await repo.deleteTask(
      id: widget.task['id'],
    );

    result.fold(
      (errorMsg) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMsg),
            backgroundColor: Colors.red,
          ),
        );
      },
      (msg) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(msg),
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

  // ================= UPDATE TASK =================

  Future<void> updateTask() async {
    if (_titleController.text.isEmpty ||
        _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter title and description',
          ),
        ),
      );

      return;
    }

    // API requires image
    if (image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please pick an image',
          ),
        ),
      );

      return;
    }

    setState(() {
      isLoading = true;
    });

    TaskModel task = TaskModel(
      title: _titleController.text,
      description: _descriptionController.text,
    );

    EditTaskRepo repo = EditTaskRepo();

    var result = await repo.editTask(
      id: widget.task['id'],
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
            backgroundColor: AppColors.primary,
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
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),

          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),

        title: Row(
          children: [
            const Spacer(),

            const Center(
              child: Text(
                'Edit Task',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),

            const Spacer(),

            GestureDetector(
              onTap: isLoading ? null : deleteTask,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFDC2626),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 18.0,
                    ),

                    SizedBox(width: 4.0),

                    Text(
                      'Delete',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),

          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),

            child: Column(
              children: [

                Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const SizedBox(height: 16),

                    Row(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        // ================= IMAGE =================

                        GestureDetector(
                          onTap: pickImage,

                          child: Container(
                            width: 60.w,
                            height: 60.h,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              image: image != null
                                  ? DecorationImage(
                                      image: FileImage(
                                        File(image!.path),
                                      ),
                                      fit: BoxFit.cover,
                                    )
                                  : const DecorationImage(
                                      image: AssetImage(
                                        'assets/images/flag.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: const [
                              Text(
                                'In Progress',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),

                              SizedBox(height: 4),

                              Text(
                                'Believe you can, and you\'re halfway there.',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ================= GROUP =================

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),

                      child: SizedBox(
                        height: 75.h,

                        child:
                            DropdownButtonFormField<String>(
                          isExpanded: true,

                          decoration: InputDecoration(
                            hintText: 'Group',

                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 14.sp,
                            ),

                            contentPadding:
                                EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 20.h,
                            ),

                            enabledBorder:
                                OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15.r),

                              borderSide:
                                  const BorderSide(
                                color: Colors.grey,
                              ),
                            ),

                            focusedBorder:
                                OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15.r),

                              borderSide:
                                  const BorderSide(
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

                          borderRadius:
                              BorderRadius.circular(20.r),

                          elevation: 3,

                          items: [

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

                    // ================= TITLE =================

                    Padding(
                      padding:
                          REdgeInsets.symmetric(horizontal: 20),

                      child: SizedBox(
                        height: 80.h,

                        child: TextFormField(
                          controller: _titleController,

                          decoration: InputDecoration(
                            hintText: 'Title',

                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 14.sp,
                            ),

                            contentPadding:
                                EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 20.h,
                            ),

                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(20.r),
                            ),

                            enabledBorder:
                                OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15.r),

                              borderSide:
                                  const BorderSide(
                                color: Colors.grey,
                              ),
                            ),

                            focusedBorder:
                                OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15.r),

                              borderSide:
                                  const BorderSide(
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
                      padding:
                          REdgeInsets.symmetric(horizontal: 20),

                      child: TextFormField(
                        minLines: 1,
                        maxLines: null,

                        keyboardType:
                            TextInputType.multiline,

                        controller: _descriptionController,

                        decoration: InputDecoration(
                          hintText: 'Description',

                          hintStyle: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 14.sp,
                          ),

                          contentPadding:
                              EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 20.h,
                          ),

                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(20.r),
                          ),

                          enabledBorder:
                              OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(15.r),

                            borderSide:
                                const BorderSide(
                              color: Colors.grey,
                            ),
                          ),

                          focusedBorder:
                              OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(15.r),

                            borderSide:
                                const BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // ================= END TIME =================

                    Padding(
                      padding:
                          REdgeInsets.symmetric(horizontal: 20),

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

                            contentPadding:
                                EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 20.h,
                            ),

                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(20.r),
                            ),

                            enabledBorder:
                                OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(15.r),

                              borderSide:
                                  const BorderSide(color: Colors.green,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 40),
                  ],
                ),

                // ================= BUTTONS =================

                Column(
                  children: [

                    // MARK AS DONE
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DoneTaskScreen(),
                          ),
                    );
                      },

                      child: Container(
                        width: double.infinity,
                        height: 56.h,

                        alignment: Alignment.center,

                        decoration: BoxDecoration(
                          color: AppColors.primary,

                          borderRadius:
                              BorderRadius.circular(14.r),

                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF149954)
                                  .withValues(alpha: 0.80),

                              blurRadius: 10,

                              spreadRadius: 0,

                          offset: const Offset(0, 5),
                            ),
                          ],
                        ),

                        child: const Text(
                          "Mark As Done",

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),

                    // UPDATED
                    GestureDetector(
                       onTap: isLoading
                          ? null
                          : updateTask,

                      child: Container(
                        width: double.infinity,
                        height: 56.h,

                        alignment: Alignment.center,

                        decoration: BoxDecoration(
                          color: AppColors.background,

                          borderRadius:
                              BorderRadius.circular(14.r),

                          border: Border.all(
                            color: AppColors.primary,
                          ),

                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF149954).withValues(alpha: 0.80),
                                blurRadius: 10,

                                spreadRadius: 0,

                                offset: const Offset(0, 5),
                            ),
                          ],
                        ),

                        child: isLoading
                            ? SizedBox(
                                width: 25.w,
                                height: 25.h,

                                child:
                                    CircularProgressIndicator(
                                  color:
                                      AppColors.primary,
                                ),
                              )
                            : const Text(
                                "Updated",

                                style: TextStyle(color:
                                      AppColors.primary,
                                  fontSize: 19,
                                  fontWeight:
                                      FontWeight.w300,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}