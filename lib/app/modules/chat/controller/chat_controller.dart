import 'package:get/get.dart';
import 'package:get_x/app/utils/base_utils.dart';

class ChatController extends GetxController {
  String userId = '';
  String senderId = '';
  BaseUtils utils = BaseUtils();

  @override
  void onInit() {
    getIds();
    super.onInit();
  }

  getIds() {
    // userId = Get.arguments['userId'];
    // senderId = utils.getId() as String;
    // print(userId);
    // print(senderId);
    print('Ola');
  }
}
