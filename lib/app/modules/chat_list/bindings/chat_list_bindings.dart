import 'package:get/get.dart';
import 'package:get_x/app/modules/chat/controller/chat_controller.dart';

class ChatListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
