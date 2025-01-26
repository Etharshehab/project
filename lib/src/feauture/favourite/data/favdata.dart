import 'package:dapp/src/feauture/favourite/model/favmodel.dart';
import 'package:dio/dio.dart';

class FavData {
  final Dio dio = Dio();
  addFav({required String id}) async {
    var response =
        await dio.post("https://elwekala.onrender.com/favorite", data: {
      "nationalId": "01056710052789",
      "productId": id,
    });
    var data = response.data;
    return data;
  }

  getAllFav() async {
    var response =
        await dio.get('https://elwekala.onrender.com/favorite', data: {
      "nationalId": "01056710052789",
    });
    try {
      List responseData = response.data["favoriteProducts"];
      List<Favmodel> favList = responseData
          .map(
            (e) => Favmodel.fromjson(e),
          )
          .toList();
      return favList;
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data);
        return error.response!.data;
      }
    }
  }

  dele({required String productId}) async {
    var response =
        await dio.delete("https://elwekala.onrender.com/favorite", data: {
      "nationalId": "01056710052789",
      "productId": productId,
    });
    try {
      var responseData = response.data;
      print(responseData);
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data);
        return error.response!.data;
      }
    }
  }
}
