import 'package:dartz/dartz.dart';

import 'package:task2_todo_design/core/network/api_helper.dart';
import 'package:task2_todo_design/core/network/end_points.dart';

class ChangePasswordRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.changePassword,
        data: {
          'current_password': currentPassword,
          'new_password': newPassword,
          'new_password_confirm': confirmPassword,
        },
        isFormData: true,
        isPrivate: true,
      );

      return right(response.data['message']);
    } catch (e) {
      return left(apiHelper.handleException(e));
    }
  }
}