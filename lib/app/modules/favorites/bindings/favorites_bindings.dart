import 'package:get/get.dart';
import 'package:get_x/app/modules/favorites/controllers/favorites_controller.dart';

class FavoritesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritesController>(() => FavoritesController());
  }
}
