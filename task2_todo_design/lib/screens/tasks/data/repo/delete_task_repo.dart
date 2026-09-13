import 'package:dartz/dartz.dart';

import 'package:task2_todo_design/core/network/api_helper.dart';
import 'package:task2_todo_design/core/network/end_points.dart';

class DeleteTaskRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> deleteTask({
    required int id,
  }) async {
    try {
      var response = await apiHelper.deleteRequest(
        endPoint: '${EndPoints.Tasks}/$id',
        isPrivate: true,
      );

      return right(response.data['message']);
    } catch (e) {
      return left(apiHelper.handleException(e));
    }
  }
}