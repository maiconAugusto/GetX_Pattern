import 'package:get/get.dart';
import 'package:get_x/app/modules/dashboard/controllers/dashboard_controller.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
  }
}
