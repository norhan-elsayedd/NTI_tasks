import 'package:dio/dio.dart';

Dio dio = Dio();


Future<void> get_user_data()async{
  try {
    var response = await dio.get(
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/get_user_data",
      data: FormData.fromMap({
        "name": "norhannn",
      }),
      options: Options(
        headers: {
          "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODg5NTUwNSwianRpIjoiYmEwZTlhNTEtNmQ0ZC00MmQzLWFjYmUtODI2Y2JiM2FkZDgwIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6OSwibmJmIjoxNzg4ODk1NTA1LCJjc3JmIjoiYzlhYmY4N2ItMWU0OC00MTExLWEzNjEtMWYxZGNjY2FkY2UwIiwiZXhwIjoxNzg4ODk2NDA1fQ.0Z1Awn0oyiAFMdz9DxjQw9mMwe3LVIdluEDkEmmzEEs"
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