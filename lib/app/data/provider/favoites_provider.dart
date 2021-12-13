import 'package:dio/dio.dart';
import 'package:get_x/app/core/api.dart';
import 'package:get_x/app/core/urls.dart';
import 'package:get_x/app/data/model/favorites_model.dart';

class FavoritesProvider {
  Future listFavoritesById(String id) async {
    Dio dio = Dio();
    String url = API().url;
    final response =
        await dio.get('$url${BaseUrls.favorites}', queryParameters: {
      id: id,
    });

    final favorites = (response.data['data'] as List)
        .map((favorite) => FavoriteModel.fromJson(favorite))
        .toList();
    return favorites;
  }
}
