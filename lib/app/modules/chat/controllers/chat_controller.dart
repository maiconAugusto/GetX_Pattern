import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/data/model/message_model.dart';
import 'package:get_x/app/data/provider/user_provider.dart';
import 'package:get_x/app/utils/base_utils.dart';

class ChatController extends GetxController {
  final UserProvider _user = Get.find<UserProvider>();
  BaseUtils utils = BaseUtils();
  late String userId = '';
  late String senderId = '';

  final RxList<MessageModel> _messages = RxList<MessageModel>();
  RxBool loading = false.obs;
  List<MessageModel> get messages => _messages.toList();
  TextEditingController message = TextEditingController();

  @override
  void onInit() async {
    await getIds();
    super.onInit();
  }

  Future<void> getIds() async {
    String? id = await utils.getId();
    senderId = id!;
    userId = Get.arguments['userId'];

    getMessages(Get.arguments['userId'], id);
  }

  Future<void> sendMessages() async {
    try {
      await _user.sendMessage(message.text, userId, senderId);
      message.clear();
    } catch (e) {
      utils.printWarning('Erro ao enviar a mensagem');
    }
  }

  Future<void> getMessages(String userID, String senderID) async {
    try {
      loading.value = true;
      final response = await _user.getMessages(userID, senderID);
      _messages.addAll(response);
      loading.value = false;
    } catch (e) {
      loading.value = false;
      utils.printWarning('Erro ao ler as mensagens');
    }
  }

  Uint8List renderAvatar(MessageModel item) {
    Uint8List urls =
        const Base64Decoder().convert(item.senderPhoto!.split('base64,')[1]);
    return urls;
  }

  renderName(MessageModel item) {
    return item.senderName;
  }
}
