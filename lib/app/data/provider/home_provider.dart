import 'package:dio/dio.dart';
import 'package:get_x/app/core/api.dart';
import 'package:get_x/app/core/urls.dart';
import 'package:get_x/app/data/model/user_model.dart';

class HomeProvider {
  Dio dio = Dio();

  Future allUsersPlatform() async {
    String api = API().url;
    final response = await dio.get('$api${BaseUrls.users}');
    final users = (response.data['data'] as List)
        .map((users) => UserModel.fromJson(users))
        .toList();

    return users;
  }
}
