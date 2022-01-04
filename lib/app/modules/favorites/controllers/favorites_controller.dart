import 'package:get/get.dart';
import 'package:get_x/app/data/model/favorites_model.dart';
import 'package:get_x/app/data/provider/favoites_provider.dart';
import 'package:get_x/app/utils/base_utils.dart';

class FavoritesController extends GetxController {
  FavoritesProvider favorite = Get.put(FavoritesProvider());
  RxBool loading = false.obs;
  final RxList<FavoriteModel> _favorites = RxList<FavoriteModel>();
  BaseUtils utils = BaseUtils();

  List<FavoriteModel> get favorites => _favorites;

  @override
  void onInit() {
    requestFavorites();
    super.onInit();
  }

  Future<void> requestFavorites() async {
    try {
      loading.value = true;
      String? id = await utils.getId();

      _favorites.clear();
      final response = await favorite.listFavoritesById(id ?? '');
      _favorites.addAll(response);
      loading.value = false;
    } catch (e) {
      loading.value = false;
    }
  }

  Future<void> refreshFavorites() async {
    try {
      loading.value = true;
      String? id = await utils.getId();
      _favorites.clear();

      final response = await favorite.listFavoritesById(id ?? '');
      _favorites.addAll(response);
      loading.value = false;
    } catch (e) {
      loading.value = false;
    }
  }
}
