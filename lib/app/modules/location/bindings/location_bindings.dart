import 'package:get/get.dart';
import 'package:get_x/app/modules/location/controllers/location_controller.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationController>(() => LocationController());
  }
}
