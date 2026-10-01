import 'package:dio/dio.dart';
import 'package:task2_todo_design/core/network/end_points.dart';


String? accessToken;
String? refreshToken;

class ApiHelper {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: EndPoints.baseUrl
  ));


  Future<Response> postRequest({
  required String endPoint,
  dynamic data,
  bool isFormData = true,
  bool isPrivate = false,
}) async {
  return _dio.post(
    endPoint,
    data: data != null
        ? isFormData
            ? FormData.fromMap(data)
            : data
        : null,
    options: Options(
      headers: {
        if (isPrivate) 'Authorization': 'Bearer $accessToken',
      },
    ),
  );
}

  Future<Response> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParams,
    bool isPrivate = false,
})async{
    return _dio.get(endPoint,
        queryParameters: queryParams,
        options: Options(
            headers: {
              if(isPrivate) 'Authorization': 'Bearer $accessToken'
            }
        )
    );

  }
  Future<Response> putRequest({
  required String endPoint,
  dynamic data,
  bool isFormData = true,
  bool isPrivate = false,
}) async {
  print('PUR URL: ${_dio.options.baseUrl}$endPoint');
  print('PUT DAT: $data');
  return _dio.put(
    endPoint,
    data: data != null
        ? isFormData
            ? FormData.fromMap(data)
            : data
        : null,
    options: Options(
      headers: {
        if (isPrivate) 'Authorization': 'Bearer $accessToken',
      },
    ),
  );
  }
  Future<Response> deleteRequest({
  required String endPoint,
  bool isPrivate = false,
}) async {
  return _dio.delete(
    endPoint,
    options: Options(
      headers: {
        if (isPrivate) 'Authorization': 'Bearer $accessToken',
      },
    ),
  );
}

  String handleException(Object e){
    String errorMsg;
    if(e is DioException){
      if(e.response?.data != null){
        var errorResponse = e.response?.data as Map<String, dynamic>;
        errorMsg = errorResponse['message'];
      }
      else{
        errorMsg = 'Network error happened try again later';
      }

    }
    else{
      errorMsg = 'error happened try again later';
    }
    return errorMsg;
  }
}


