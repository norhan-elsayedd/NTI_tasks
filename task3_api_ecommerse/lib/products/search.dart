import 'package:dio/dio.dart';

Dio dio = Dio();


Future<void> search()async{
  try {
    var response = await dio.get(
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/products/search?q=p",
      queryParameters: {
        "q": "p",
      },
      options: Options(
        headers: {
          "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODkwOTE0MiwianRpIjoiNWEyNzZlYjktNTNhNS00MWI2LTk3ZjgtNTAxYzI5ZDJiNzYyIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6OSwibmJmIjoxNzg4OTA5MTQyLCJjc3JmIjoiNjQwNDAzMmEtNTgzZS00ZTI4LTk2MDktZjE1N2VkMDNjNzU3IiwiZXhwIjoxNzg4OTEwMDQyfQ.3-pODUSsgAYVWdlBLPP7g2nPTwYzgfx1zClPvRi_hLI"
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