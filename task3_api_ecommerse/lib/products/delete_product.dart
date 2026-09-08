import 'package:dio/dio.dart';

Dio dio = Dio();


Future<void> delete_product()async{
  try {
    var response = await dio.delete(
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/product/1",
      options: Options(
        headers: {
          "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODkwOTgxNiwianRpIjoiY2EyZWYyY2MtZjhlNS00YjgwLWFlYjYtYjdjNzM1ZTg2ZDIzIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6OSwibmJmIjoxNzg4OTA5ODE2LCJjc3JmIjoiM2E1NDE3MDUtMDI3MC00M2E5LThjNGYtYTM0ZTkyMjVmMzM4IiwiZXhwIjoxNzg4OTEwNzE2fQ.Hm5adwSoJYjgZcUlFANQcnLCdbQt1QToph6-tT3SOso"
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