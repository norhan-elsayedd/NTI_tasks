import 'package:dio/dio.dart';

Dio dio = Dio();


Future<void> edit_slider()async{
  try {
    var response = await dio.put(
      "https://nti-ecommerce-api-production-896c.up.railway.app/api/slider/2",
      data: FormData.fromMap({
        "title": "task-1",
        "description": "task 1 + description",
      }),
      options: Options(
        headers: {
          "Authorization":"Bearer yJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc4ODg5ODg4NywianRpIjoiMDY5ZDE5NTMtYWQ0Yi00MWE4LTk2ODktMjQyNjdmNzU3NjBiIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6OSwibmJmIjoxNzg4ODk4ODg3LCJjc3JmIjoiMmVlOTg2M2YtMTg0MS00ZGZmLTk0NWUtNDA0ZWZjYmUzOTU5IiwiZXhwIjoxNzg4ODk5Nzg3fQ.jgZdXLBPCISEhCFUV-hmwaKkzc81r_tS2WEVY5bRJ1g"
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