import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:task2_todo_design/core/network/api_helper.dart';
import 'package:task2_todo_design/core/network/end_points.dart';
import 'package:task2_todo_design/screens/tasks/data/model/task_model.dart';

class AddTaskRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> addTask({
    required TaskModel task,
    File? image,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'title': task.title,
        'description': task.description,

        if (image != null)
          'image': await MultipartFile.fromFile(
            image.path,
          ),
      });

      var response = await apiHelper.postRequest(
        endPoint: EndPoints.newTask,
        data: formData,
        isFormData: false,
        isPrivate: true,
      );

      return right(response.data['message']);
    } catch (e) {
      return left(apiHelper.handleException(e));
    }
  }
}