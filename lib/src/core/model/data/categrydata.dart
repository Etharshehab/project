import 'package:dapp/src/core/model/model/categorymodel.dart';
import 'package:dio/dio.dart';

class CategoryData {
  static Dio dio = Dio();
  Future<List<Categorymodel>> getData({required final String endpoint}) async {
    var response =
        await dio.get('https://fakestoreapi.com/products/category/$endpoint');
    if (response.statusCode == 200) {
      List data = response.data;
      List<Categorymodel> categoryList =
          data.map((e) => Categorymodel.fromJson(e)).toList();
      return categoryList;
    } else {
      throw Exception('failed to load data');
    }
  }
}
