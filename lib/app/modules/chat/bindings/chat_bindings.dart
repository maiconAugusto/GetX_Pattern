import 'package:get/get.dart';
import 'package:get_x/app/modules/chat/controller/chat_controller.dart';

class ChatBindinds extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
