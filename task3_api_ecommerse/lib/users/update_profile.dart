import 'package:dio/dio.dart';

Dio dio = Dio();


Future<void> update_profile()async{
  try {
    var response = await dio.put(
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/update_profile",
      data: FormData.fromMap({
        "name": "norhannn",
        "phone": "01202498336", 
      }),
      options: Options(
        headers: {
          "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODg5NDMzMywianRpIjoiNGUzZDY3NmYtYTIzMC00ZjY1LWE1MDctYmQyNDViMTNmMTAxIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6OSwibmJmIjoxNzg4ODk0MzMzLCJjc3JmIjoiYWY0NWQ0NDYtOTRmYi00YTk4LTllYTMtZGRmMDYyNDlmMzI1IiwiZXhwIjoxNzg4ODk1MjMzfQ.QuedHUZhpfFbAOyaj8GsznFaJvT3oRwPZ9DkMcxWIoA"
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