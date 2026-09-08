import 'package:dio/dio.dart';

Dio dio = Dio();


Future<void> get_categories()async{
  try {
    var response = await dio.get(
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/categories",
      options: Options(
        headers: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODkwMDM2NiwianRpIjoiODljNDJkYzctOWY4Zi00MjY3LWIwZWItMTc1MzU1OGQ5OTA3IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6OSwibmJmIjoxNzg4OTAwMzY2LCJjc3JmIjoiZmUwZTVkMzMtOTczNC00ZGJmLTg2MWMtZmIwODQwYjdhYjdiIiwiZXhwIjoxNzg4OTAxMjY2fQ.D9j6JRZSFQ_nz4Whk2dupluZ6GTcXAuYLVJl0OpvnFg'
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