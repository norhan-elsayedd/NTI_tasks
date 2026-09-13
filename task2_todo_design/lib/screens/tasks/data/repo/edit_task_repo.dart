import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:task2_todo_design/core/network/api_helper.dart';
import 'package:task2_todo_design/core/network/end_points.dart';
import 'package:task2_todo_design/screens/tasks/data/model/task_model.dart';

class EditTaskRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> editTask({
    required int id,
    required TaskModel task,
    required File image,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'title': task.title,
        'description': task.description,
        'image': await MultipartFile.fromFile(
          image.path,
        ),
      });

      var response = await apiHelper.putRequest(
        endPoint: '${EndPoints.Tasks}/$id',
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
