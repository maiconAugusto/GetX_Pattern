import 'package:get/get.dart';
import 'package:get_x/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get_x/app/modules/my_data/controllers/my_data_controller.dart';

class DashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<MyDataController>(() => MyDataController());
  }
}
