import 'package:get/get.dart';
import 'package:get_x/app/modules/menu/controllers/menu_controller.dart';

class MenuBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuController>(() => MenuController());
  }
}
