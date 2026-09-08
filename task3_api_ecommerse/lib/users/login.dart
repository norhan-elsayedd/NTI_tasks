import 'package:dio/dio.dart';

Dio dio = Dio();


Future<void> login()async{
  try {
    var response = await dio.post(
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/login",
      data: FormData.fromMap({
        "email": "norhan@gmail.com",
        "password": "1102007",
        
      })
      
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