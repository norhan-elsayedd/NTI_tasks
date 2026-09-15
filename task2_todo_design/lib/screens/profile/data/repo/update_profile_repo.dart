import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:task2_todo_design/core/network/api_helper.dart';
import 'package:task2_todo_design/core/network/end_points.dart';

class UpdateProfileRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> updateProfile({
    required String username,
    required File image,
  }) async {
    try {
      FormData formData = FormData.fromMap({
        'username': username,
        'image': await MultipartFile.fromFile(
          image.path,
        ),
      });

      var response = await apiHelper.putRequest(
        endPoint: EndPoints.updateProfile,
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