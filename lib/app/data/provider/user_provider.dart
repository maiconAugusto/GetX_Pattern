import 'package:dio/dio.dart';
import 'package:get_x/app/core/api.dart';
import 'package:get_x/app/core/urls.dart';
import 'package:get_x/app/data/model/user_model.dart';

class UserProvider {
  Dio dio = Dio();

  Future allUsersPlatform() async {
    String api = API().url;
    final response = await dio.get('$api${BaseUrls.users}');
    final users = (response.data['data'] as List)
        .map((users) => UserModel.fromJson(users))
        .toList();

    return users;
  }

  Future<UserModel> showUser(String id) async {
    String api = API().url;
    final response = await dio.get('$api${BaseUrls.user}/$id');
    final user = UserModel.fromJson(response.data['data']);

    return user;
  }

  Future favorite(String userId, String favoriteId) async {
    String api = API().url;
    final response = await dio.post('$api${BaseUrls.favorite}', data: {
      'userId': userId,
      'favoriteId': favoriteId,
    });
    final favorite = response.data['data'];

    return favorite;
  }
}
