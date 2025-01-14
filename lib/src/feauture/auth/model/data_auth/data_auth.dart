import 'package:dio/dio.dart';

class DataAuth {
  final Dio dio = Dio();

  PostData({
    required name,
    required email,
    required phone,
    required nationalId,
    required gender,
    required password,
    required token,
    required profileImage,
  }) async {
    var repo =
        await dio.post("https://elwekala.onrender.com/user/register", data: {
      "name": name,
      "email": email,
      "phone": phone,
      "nationalId": nationalId,
      "gender": gender,
      "password": password,
      "token": token,
      "profileImage": profileImage
    });
    try {
      var data = repo.data;
      return data;
    } on DioException catch (error) {
      if (error.message != null) {
        print("++++++++++++");
        print(error.response!.data["message"]);
        print("+++++++++++++++++++++++++++++++++++++++++++++");
        return error.response!.data;
      }
    }
  }
}
