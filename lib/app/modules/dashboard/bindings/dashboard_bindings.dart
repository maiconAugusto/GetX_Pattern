import 'package:get/get.dart';
import 'package:get_x/app/data/provider/user_provider.dart';
import 'package:get_x/app/modules/chat_list/controllers/chat_list.dart';
import 'package:get_x/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get_x/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:get_x/app/modules/home/controllers/home_controller.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<UserProvider>(() => UserProvider());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<FavoritesController>(() => FavoritesController());
    Get.lazyPut<ChatListController>(() => ChatListController());
  }
}
