import 'package:get/get.dart';
import 'package:get_x/app/data/provider/user_provider.dart';
import 'package:get_x/app/modules/home/controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<UserProvider>(() => UserProvider());
  }
}
