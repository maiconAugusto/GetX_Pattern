import 'package:get/get.dart';
import 'package:get_x/app/modules/password/controllers/password_controller.dart';

class PasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordController>(() => PasswordController());
  }
}
