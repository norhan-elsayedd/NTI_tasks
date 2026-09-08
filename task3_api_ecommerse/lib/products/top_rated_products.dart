import 'package:dio/dio.dart';

Dio dio = Dio();


Future<void> top_rated_product()async{
  try {
    var response = await dio.get(
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/top_rated_products",
      options: Options(
        headers: {
          "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODkwOTQwMywianRpIjoiZDc1ZGFhNTUtNTE4YS00ZTM4LWJhMDktMzMyOTJkNmU5NmI1IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6OSwibmJmIjoxNzg4OTA5NDAzLCJjc3JmIjoiN2FhMWRjMTUtMjNkZC00NzI4LWFmMDktYzdlNTJmYjQ3NTA1IiwiZXhwIjoxNzg4OTEwMzAzfQ.0fgW3tzkETniQTVoXwiUcmv-Bgctc1iPsqsMlWbkXfw"
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