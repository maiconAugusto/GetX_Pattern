import 'package:dio/dio.dart';
import 'package:get_x/app/core/api.dart';
import 'package:get_x/app/core/urls.dart';
import 'package:get_x/app/data/model/user_model.dart';

class UserProvider {
  Dio dio = Dio();

  Future registerUser(UserModel user) async {
    String api = API().url;
    final response = await dio.post('$api${BaseUrls.register}', data: {
      "name": user.name,
      "email": user.email,
      "cpf": user.cpf,
      "cep": user.cep,
      "occupation": user.occupation,
      "description": user.description,
      "password": user.password,
      "birthDate": user.birthDate,
      "city": user.city,
      "state": user.state,
      "country": user.country,
      "houseNumber": user.houseNumber,
      "active": true,
      "phone": user.phone,
      "photo": user.photo
    });
    return response.data['data'];
  }

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
      'user': userId,
      'favorite': favoriteId,
    });
    final favorite = response.data['data'];

    return favorite;
  }

  Future removeFavorite(String id) async {
    String api = API().url;
    final response = await dio.delete('$api${BaseUrls.favorite}/$id');
    final favorite = response.data['data'];

    return favorite;
  }
}
