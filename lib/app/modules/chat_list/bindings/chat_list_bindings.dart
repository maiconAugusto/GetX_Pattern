import 'package:get/get.dart';
import 'package:get_x/app/data/provider/user_provider.dart';
import 'package:get_x/app/modules/chat_list/controllers/chat_list.dart';

class ChatListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatListController>(() => ChatListController());
    Get.lazyPut<UserProvider>(() => UserProvider());
  }
}
