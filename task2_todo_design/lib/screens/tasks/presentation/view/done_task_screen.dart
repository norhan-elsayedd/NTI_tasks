import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task2_todo_design/core/utilies/app_assests.dart';
import 'package:task2_todo_design/core/utilies/app_colors.dart';
import 'package:task2_todo_design/screens/tasks/presentation/view/done_task_screen.dart';

class DoneTaskScreen extends StatefulWidget { 
  const DoneTaskScreen({super.key}); 
 
  @override 
  State<DoneTaskScreen> createState() => _EditTaskScreenState(); 
} 
 
class _EditTaskScreenState extends State<DoneTaskScreen> { 
  final TextEditingController _titleController = TextEditingController(); 
  final TextEditingController _descriptionController = TextEditingController();
  final groupController = TextEditingController();

  final endTimeController = TextEditingController();

   DateTime? selectedDate;
    TimeOfDay? selectedTime;


    @override
    void dispose() {
      _titleController.dispose();
      _descriptionController.dispose();
      groupController.dispose();
      endTimeController.dispose();

      super.dispose();
    }

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
                'Done Task', 
                style: TextStyle( 
                  fontSize: 19, 
                  fontWeight: FontWeight.w300, 
                ), 
              ), 
            ), 
            const Spacer(), 
            Container( 
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 6.0), 
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
          ], 
        ), 
      ), 
      body: SafeArea( 
        child: Padding( 
          padding: const EdgeInsets.symmetric(horizontal: 20.0), 
          child: SingleChildScrollView( 
            physics: const BouncingScrollPhysics(), 
            child: Column( 
              children: [ 
                Column( 
                  crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [ 
                    const SizedBox(height: 16), 
                    Row( 
                      crossAxisAlignment: CrossAxisAlignment.start, 
                      children: [ 
                        Container( 
                          width: 60.w, 
                          height: 60.h, 
                          decoration: const BoxDecoration( 
                            shape: BoxShape.circle, 
                            image: DecorationImage(image: AssetImage('assets/images/flag.png'), 
                            fit: BoxFit.cover) 
                          ), 
                        ), 
                        const SizedBox(width: 14), 
                        Expanded( 
                          child: Column( 
                            crossAxisAlignment: CrossAxisAlignment.start, 
                            children: const [ 
                              Text( 
                                'Done', 
                                style: TextStyle( 
                                  fontSize: 14, 
                                  fontWeight: FontWeight.w300, 
                                ), 
                              ), 
                              SizedBox(height: 4), 
                              Text( 
                                'congrats!', 
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
                              if(value!= null){
                                groupController.text=value;
                              }
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 15.h),

                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 20),
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
                        
                        controller: _descriptionController,
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

                  

                    SizedBox(height: 20), 

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
                    SizedBox(height: 40), 
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