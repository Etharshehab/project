import 'package:dapp/src/feauture/get_lapTop/model/get_laptop_model.dart';
import 'package:dio/dio.dart';

class GetLaptopData {
  final Dio dio = Dio();
  getAllLap() async {
    var response = await dio.get(
      "https://elwekala.onrender.com/product/Laptops",
    );
    try {
      if (response.statusCode == 200) {
        List respnseData = response.data["product"];
        List<Product> listmodel = respnseData
            .map(
              (e) => Product.fromjson(e),
            )
            .toList();
        return listmodel;
      }
    } on DioException catch (error) {
      if (error.response != null) {}
    }
  }

  updateData({required String id, required String quantity}) async {
    var response = await dio.put("https://elwekala.onrender.com/cart", data: {
      "nationalId": "01056710052789",
      "productId": id,
      "quantity": quantity
    });
    try {
      var responseData = response.data;
      print(responseData);
      return responseData;
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data);
        return error.response!.data;
      }
    }
  }
}
