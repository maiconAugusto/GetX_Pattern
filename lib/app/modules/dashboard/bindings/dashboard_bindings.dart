import 'package:get/get.dart';
import 'package:get_x/app/data/provider/home_provider.dart';
import 'package:get_x/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get_x/app/modules/home/controllers/home_controller.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeProvider>(() => HomeProvider());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
