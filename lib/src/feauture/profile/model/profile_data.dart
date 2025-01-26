import 'package:dapp/src/core/builder/cash.dart';
import 'package:dapp/src/feauture/profile/model/profile_model.dart';
import 'package:dio/dio.dart';

var getToken = CacheShared.shared!.getDouble('token');

class ProfileData {
  Dio dio = Dio();
  getData() async {
    var response = await dio.post('https://elwekala.onrender.com/user/profile',
        data: {"token": "vx343icq3udm65nxbwj"});
    try {
      var repoData = response.data;
      var user = UserProfile.fromJson(repoData);
      return user;
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }
}
