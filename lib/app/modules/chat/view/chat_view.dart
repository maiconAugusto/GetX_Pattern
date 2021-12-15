import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/core/components/simmer/simmer.dart';
import 'package:get_x/app/modules/chat/controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigoAccent,
          title: const Text(
            'Mensagens',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_rounded)),
        ),
        body: Obx(() {
          return controller.loading.value == true
              ? const Simmer()
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.messages.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            visualDensity:
                                VisualDensity.adaptivePlatformDensity,
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.memory(
                                    controller.renderAvatar(
                                        controller.messages[index]),
                                    fit: BoxFit.cover,
                                    height: 30,
                                    width: 30)),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller
                                      .renderName(controller.messages[index]),
                                  style: Get.textTheme.bodyText1,
                                ),
                              ],
                            ),
                            subtitle: Text(
                              controller.messages[index].message ?? '',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.blueGrey[800],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 60,
                      margin: const EdgeInsets.only(
                          bottom: 24, left: 10, right: 10),
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
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                            controller: controller.message,
                            decoration: const InputDecoration.collapsed(
                                hintText: 'Enviar mensagem'),
                          )),
                          IconButton(
                              onPressed: () {
                                controller.sendMessages();
                              },
                              icon: const Icon(
                                Icons.send,
                                color: Colors.indigoAccent,
                              ))
                        ],
                      ),
                    ),
                  ],
                );
        }));
  }
}
