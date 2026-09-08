import 'package:dio/dio.dart';

Dio dio = Dio();


Future<void> cancel_order()async{
  try {
    var response = await dio.post(
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/orders/cancel/1",
      options: Options(
        headers: {
          "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODkxMDY4NywianRpIjoiNTUyM2M1MzctYmNlZi00ZjBkLWJjMmItOGM1Nzc2MTU4MzYzIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6OSwibmJmIjoxNzg4OTEwNjg3LCJjc3JmIjoiMjBjOGIwODgtMmFhNS00NGUxLTk2NDgtNzc5YWQ3NjM2OTAzIiwiZXhwIjoxNzg4OTExNTg3fQ.bcGQ7SmhfYkFLrdxUE1SUojPMZj69tlJKCtPmjkdNSs"
        }
      )
      
  );

  print(response.toString());

}
  catch (e) {
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