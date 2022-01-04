import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/core/components/profile_card/profile_card.dart';
import 'package:get_x/app/core/components/simmer/simmer.dart';
import 'package:get_x/app/modules/chat_list/controllers/chat_list.dart';
import 'package:get_x/app/routes/app_routes.dart';

class ChatListView extends GetView<ChatListController> {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      if (controller.isLoading == true) {
        return const Simmer();
      }
      return Column(
        children: [
          const SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              alignment: Alignment.center,
              height: 60,
              padding: const EdgeInsets.only(
                left: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: TextFormField(
                  autofocus: false,
                  decoration: const InputDecoration(
                    hintText: 'Buscar',
                    border: InputBorder.none,
                  )),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.resume.length,
              itemBuilder: (context, index) {
                if (controller.iduser.value ==
                    controller.resume[index].sender[0]['_id']) {
                  return ProfileCard(
                      photo: controller.resume[index].user[0]['photo'] ?? '',
                      name: controller.resume[index].user[0]['name'] ??
                          'Sem nome',
                      ocupation: controller.resume[index].message ?? '',
                      onPress: () {
                        Get.toNamed(Routes.chat, arguments: {
                          'userId': controller.resume[index].userId
                        });
                      },
                      height: 60,
                      width: 60,
                      rate: 2,
                      isRate: false,
                      radius: 50.0,
                      expandend: false,
                      description: '');
                }
                return ProfileCard(
                    photo: controller.resume[index].sender[0]['photo'] ?? '',
                    name: controller.resume[index].sender[0]['name'] ??
                        'Sem nome',
                    ocupation: controller.resume[index].message ?? '',
                    onPress: () {
                      Get.toNamed(Routes.chat, arguments: {
                        'userId': controller.resume[index].userId
                      });
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
          )
        ],
      );
    }));
  }
}
