import 'package:get/get.dart';

class DashboardController extends GetxController {
  int tabIndex = 0;
  String title = 'Home';

  void changeTabIndex(int index) {
    tabIndex = index;
    switch (tabIndex) {
      case 0:
        {
          title = 'Home';
          break;
        }
      case 1:
        {
          title = 'Favoritos';
          break;
        }
      case 2:
        {
          title = 'Meus dados';
          break;
        }
      case 3:
        {
          title = 'Chat';
          break;
        }
      default:
        break;
    }
    update();
  }
}
