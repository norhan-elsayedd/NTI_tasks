import 'package:dio/dio.dart';

Dio dio = Dio();


Future<void> new_product()async{
  try {
    var response = await dio.post(
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/new_product",
      data: FormData.fromMap({
        "name": "new pr1",
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
          "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODk1NTE4MiwianRpIjoiZDU4NjJhYzgtNTRjMi00NWU2LWI0ZDMtODgyOTY4Yjg0ZjA3IiwidHlwZSI6ImFjY2VzcyIsInN1YiI6OSwibmJmIjoxNzg4OTU1MTgyLCJjc3JmIjoiMjZkZjlkNjktY2EwNC00Nzc3LWJhNzMtNDBmYmQzOTliZGYxIiwiZXhwIjoxNzg4OTU2MDgyfQ.Lsi9xTAf1K27BmVzy6Qho5CnWUtOzTbH2CLJD61ayCo"
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