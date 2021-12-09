import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/core/components/profile_card/profile_card.dart';
import 'package:get_x/app/modules/chat_list/controllers/chat_list.dart';
import 'package:get_x/app/routes/app_routes.dart';

class ChatListView extends GetView<ChatListController> {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return ProfileCard(
              name: 'Maicon Augusto Carvalho de Freitas',
              ocupation: 'Desenvolvedor Jr.',
              onPress: () {
                Get.toNamed(Routes.chat);
              },
              height: 60,
              width: 60,
              rate: 2,
              isRate: false,
              radius: 50.0,
              expandend: false,
              description: '');
        },
      ),
    ));
  }
}
