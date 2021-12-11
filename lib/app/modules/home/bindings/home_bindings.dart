import 'package:get/get.dart';
import 'package:get_x/app/data/provider/home_provider.dart';
import 'package:get_x/app/modules/home/controllers/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HomeProvider>(() => HomeProvider());
  }
}
