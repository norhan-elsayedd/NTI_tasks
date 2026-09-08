import 'package:dio/dio.dart';

Dio dio = Dio();


Future<void> edit_product()async{
  try {
    var response = await dio.put(
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/product/1",
      data: FormData.fromMap({
        "name": "product 3 +",
        "description": "product 3 + description",
        "rating": "5",
        "best_seller": "1",
        "price": "50",
        "image": await MultipartFile.fromFile(
          r"D:\images\baby.jpg",
          filename: "baby.png",
        ), 
        "category_id": "2",
      }),
      options: Options(
        headers: {
          "Authorization":"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODkwODM1NCwianRpIjoiMWJlZTA5MjItYjdjOC00NmQxLTllYWQtZDdjNDA4NjQ2ZDYyIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6OSwibmJmIjoxNzg4OTA4MzU0LCJjc3JmIjoiNjA4ZDI2OGMtZDZjNS00NzkzLWE2OWEtMWU0YmZhNDMxYTA2IiwiZXhwIjoxNzg4OTA5MjU0fQ.TGG_76x8Roh_SAvHSByzCFskcJ4cgFY_XAewFBO23Ww"
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