import 'package:dartz/dartz.dart';

import 'package:task2_todo_design/core/network/api_helper.dart';
import 'package:task2_todo_design/core/network/end_points.dart';

class HomeRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, List>> getTasks() async {
    try {
      var response = await apiHelper.getRequest(
          endPoint: EndPoints.myTasks,
        isPrivate: true
      );
      var jsonResponse = response.data as Map<String, dynamic>;
      return right(jsonResponse['tasks']);
    } catch (e) {
      return left(apiHelper.handleException(e));
    }
  }
}