// ignore_for_file: avoid_print

import 'package:dapp/src/feauture/cart/model/cart-model.dart';
import 'package:dio/dio.dart';

class CartService {
  static Dio dio = Dio();

  static addCartData() async {
    Response response =
        await dio.post('https://elwekala.onrender.com/cart/add', data: {
      "nationalId": '37776456788746', //"37776456788746"
      "productId": "64666d3a91c71d884185b774",
      "quantity": "1"
    });
    var jsonData = response.data;
    print("___________________________________________________");
    print(jsonData);
    print("___________________________________________________");
    return jsonData;
  }

  getAllCart() async {
    var response =
        await dio.get('https://elwekala.onrender.com/cart/allProducts', data: {
      "nationalId": '37776456788746',
    });

    try {
      if (response.statusCode == 200) {
        List dataRepo = response.data["products"];
        List<CartModel> listcart =
            dataRepo.map((e) => CartModel.fromJson(e)).toList();
        //   print(listcart[2].image);
        return listcart;
      }
    } on DioException catch (error) {
      if (error.response != null) {
        print(error.response!.data['message']);
        return error.response!.data;
      }
    }
  }

  deleteCart({required String productId}) async {
    var response = await dio.delete("https://elwekala.onrender.com/cart/delete",
        data: {
          "nationalId": '37776456788746',
          "productId": productId,
          "quantity": "1"
        });

    var data = response.data;
    return data;
  }
}
