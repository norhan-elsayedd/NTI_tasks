import 'package:dio/dio.dart';

Dio dio = Dio();


// ignore: non_constant_identifier_names
Future<void> add_to_favorite()async{
  try {
    var response = await dio.post(
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/add_to_favorite",
      data: FormData.fromMap({
        "product_id": "1",
      }),
      options: Options(
        headers: {
          "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODkwNzQzNywianRpIjoiMjIzZjViYzctOThjNi00NDM4LWJlNDktMDdiMzdiZGZmZDU4IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6OSwibmJmIjoxNzg4OTA3NDM3LCJjc3JmIjoiNTEyMWUwZmYtM2EwMy00YWY4LWFiNjQtNjEwZWFiNzc3MzQ1IiwiZXhwIjoxNzg4OTA4MzM3fQ.Xmev00EiYol5q1NgJXU9WI0jfDC6O8MNItQpKJoyhT8"
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