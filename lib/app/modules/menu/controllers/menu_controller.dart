import 'package:get/get.dart';
import 'package:get_x/app/routes/app_routes.dart';
import 'package:get_x/app/utils/base_utils.dart';

class MenuController extends GetxController {
  BaseUtils utils = BaseUtils();

  exit() async {
    await utils.removeId();
    Get.toNamed(Routes.password);
  }
}
