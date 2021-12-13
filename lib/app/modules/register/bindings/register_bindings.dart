import 'package:get/get.dart';
import 'package:get_x/app/data/provider/address_provider.dart';
import 'package:get_x/app/data/provider/user_provider.dart';
import 'package:get_x/app/modules/register/controllers/register_controller.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<AddressProvier>(() => AddressProvier());
    Get.lazyPut<UserProvider>(() => UserProvider());
  }
}
