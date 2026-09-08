import 'package:dio/dio.dart';

Dio dio = Dio();


Future<void> get_products()async{
  try {
    var response = await dio.get(
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/products",
      options: Options(
        headers: {
          "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODkwODkzOSwianRpIjoiYjZjMTQyNzgtM2EwYi00YjBhLTkyNWUtMDE1NWY0NDE4MjlkIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6OSwibmJmIjoxNzg4OTA4OTM5LCJjc3JmIjoiNDhlNzRiYmEtYjM4Yi00MTQwLTk3OWItNzZlNzg3YmY4NWJiIiwiZXhwIjoxNzg4OTA5ODM5fQ.q8_KcJozjkPa5-RKYiFx_qQT0s93OYQ_SUv2H_aWADw"
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