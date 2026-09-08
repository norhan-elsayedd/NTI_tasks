import 'package:dio/dio.dart';

Dio dio = Dio();


Future<void> get_orders()async{
  try {
    var response = await dio.get(
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/orders",
      options: Options(
        headers: {
          "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODkxMDUyMSwianRpIjoiMTMzN2E2ZDItMjRiNy00NzU4LTg1ZjAtYzRlYWM3Njc5NTlkIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6OSwibmJmIjoxNzg4OTEwNTIxLCJjc3JmIjoiODk0NTA0Y2MtN2ZmYi00NWYzLThkYWItNjM2MTAyMDU5M2IyIiwiZXhwIjoxNzg4OTExNDIxfQ.s7L3GzU9qCO6Q-_exdtOKJY1KmVU2gKRHIH82BmCsv8"
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