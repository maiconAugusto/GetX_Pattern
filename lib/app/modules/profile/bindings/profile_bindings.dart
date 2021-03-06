import 'package:get/get.dart';
import 'package:get_x/app/data/provider/user_provider.dart';
import 'package:get_x/app/modules/profile/controllers/profile_controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<UserProvider>(() => UserProvider());
  }
}
