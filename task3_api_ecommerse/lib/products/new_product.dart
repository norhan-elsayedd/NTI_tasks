import 'package:dio/dio.dart';

Dio dio = Dio();


Future<void> new_product()async{
  try {
    var response = await dio.post(
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/new_product",
      data: FormData.fromMap({
        "name": "new test pr",
        "description": "product 1 description",
        "rating": "4.8",
        "best_seller": "1",
        "price": "80",
        "image": await MultipartFile.fromFile(
          r"D:\images\baby.jpg",
          filename: "baby.png",
        ), 
        "category_id": "3",
      }),
      options: Options(
        headers: {
          "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODkwMzc4MywianRpIjoiZGExMjg2NTAtNTJlMC00OTMzLWI3OGItNGZjMjY0YzBlODlhIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6OSwibmJmIjoxNzg4OTAzNzgzLCJjc3JmIjoiMGRiNmQ1YzItNjNjZi00NjFmLTliNDQtNzVkYTY0ZWI5ZDc3IiwiZXhwIjoxNzg4OTA0NjgzfQ.sBatjaNMsUCRMxk0F_DK-izGtfc3jzNjgOmSFu6erkk"
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