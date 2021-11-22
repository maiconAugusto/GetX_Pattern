import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final Rx<bool> passwordVisible = false.obs;
  GlobalKey key = GlobalKey<FormState>();

  void lockPassword() {
    if (passwordVisible.value == false) {
      passwordVisible.value = true;
    } else {
      passwordVisible.value = false;
    }
  }

  void printWarning(String info) {
    final snackBar = SnackBar(
      content: Text(
        info,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.redAccent[200],
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  Future<void> auth() async {
    if (email.text.isEmpty && password.text.isEmpty) {
      printWarning('Informe seu e-mail e senha.');
      return;
    }
    if (email.text.isEmpty) {
      printWarning('Informe seu e-mail.');
      return;
    }
    if (password.text.isEmpty) {
      printWarning('Informe sua senha.');
      return;
    }
  }
}
