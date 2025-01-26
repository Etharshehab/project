import 'package:dio/dio.dart';

class DataCart {
  Dio dio = Dio();
  addcart({required String id}) async {
    var response = await dio.post("https://elwekala.onrender.com/cart/add",
        data: {
          "productId": id,
          "nationalId": "30209011219366",
          "quantity": "1"
        });
    var data = response.data;
    return data;
  }
}
