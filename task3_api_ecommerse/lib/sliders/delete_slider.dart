import 'package:dio/dio.dart';

Dio dio = Dio();

Future<void> delete_slider()async{
  try{
    var response = await dio.delete(
      'https://nti-ecommerce-api-production-896c.up.railway.app/api/slider/3',
      options: Options(
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODg5OTMwNywianRpIjoiYjY5MWUzMjAtNWRlOC00MzVlLWE2YzMtMjY4OTU5ODEwOTM4IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6OSwibmJmIjoxNzg4ODk5MzA3LCJjc3JmIjoiMTZlN2UxNWQtZWM3ZS00OTU4LWEzYjMtMTE2NTFiNTI4Yjg3IiwiZXhwIjoxNzg4OTAwMjA3fQ.m2uV9ovRU7AuV8GWJQxZr5DfbQ4OI8UWmp4rzBkGGPQ'
        }
      )
    );
    print(response.data.toString());
  }
  catch(e){
    handleException(e);
  }
}



void handleException(Object e){
  
    if(e is DioException){
      if(e.response?.data != null){
        var errorResponse = e.response?.data as Map<String, dynamic>;
        print(errorResponse['message']);
      }
      else{
        print('Network error happened try again later');
      }
    }
    else{
      print('error happened try again later');
    }
}