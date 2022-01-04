import 'package:get/get.dart';
import 'package:get_x/app/modules/chat_list/controllers/chat_list.dart';
import 'package:get_x/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:get_x/app/modules/home/controllers/home_controller.dart';

class DashboardController extends GetxController {
  FavoritesController favoritesController = Get.find();
  HomeController homeController = Get.find();
  ChatListController chatResume = Get.find();

  int tabIndex = 0;
  String title = 'Home';

  void changeTabIndex(int index) {
    tabIndex = index;
    switch (tabIndex) {
      case 0:
        {
          title = '';
          homeController.requestAllUsers();
          break;
        }
      case 1:
        {
          title = 'Favoritos';
          favoritesController.requestFavorites();
          break;
        }
      case 2:
        {
          title = 'Menu';
          break;
        }
      case 3:
        {
          title = 'Chat';
          chatResume.resumeListMessage();
          break;
        }
      default:
        break;
    }

    update();
  }
}
