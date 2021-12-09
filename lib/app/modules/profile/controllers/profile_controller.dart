import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxBool openAvaliation = false.obs;
  RxBool openAddress = false.obs;
  RxBool isFavorite = false.obs;

  @override
  void onInit() {
    hasFavorite();
    super.onInit();
  }

  void hasFavorite() {
    if (Get.arguments?['isFavorite'] != null) {
      isFavorite.value = Get.arguments['isFavorite'];
    }
  }

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
