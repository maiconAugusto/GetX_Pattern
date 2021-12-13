import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/core/images.dart';
import 'package:get_x/app/modules/chat/controller/chat_controller.dart';
import 'package:progressive_image/progressive_image.dart';

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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              reverse: true,
              itemBuilder: (context, index) {
                return ListTile(
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: ProgressiveImage(
                        thumbnail: const NetworkImage(Images.profile),
                        image: const NetworkImage(
                          Images.woman,
                        ),
                        height: 40,
                        fit: BoxFit.cover,
                        width: 40,
                        placeholder: null,
                      )),
                  title: Text(
                    'Boa tarde, gostaria de saber se voce tem disponibilidade para um trabalho totalmente remote?',
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
            margin: const EdgeInsets.only(bottom: 24, left: 10, right: 10),
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
            child: Row(
              children: [
                const Expanded(
                    child: TextField(
                  decoration:
                      InputDecoration.collapsed(hintText: 'Enviar mensagem'),
                )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: Colors.indigoAccent,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
