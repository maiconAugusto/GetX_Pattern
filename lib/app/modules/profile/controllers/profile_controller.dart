import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool openAvaliation = false.obs;
  RxBool openAddress = false.obs;

  void printWarning(String info) {
    final snackBar = SnackBar(
      content: Text(
        info,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green[400],
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
