import 'package:get/get.dart';
import 'package:get_x/app/data/provider/user_provider.dart';
import 'package:get_x/app/modules/chat/controllers/chat_controller.dart';

class ChatBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<UserProvider>(() => UserProvider());
  }
}
