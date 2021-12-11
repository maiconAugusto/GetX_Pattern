import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/data/model/auth_model.dart';
import 'package:get_x/app/data/provider/authentication.dart';
import 'package:get_x/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final AuthenticationProvider _authentication = AuthenticationProvider();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final Rx<bool> passwordVisible = false.obs;
  RxBool loading = false.obs;
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
    try {
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
      loading.value = true;

      await _authentication.auth(email.text, password.text);
      loading.value = false;
      Get.offAllNamed(Routes.dashboard);
    } on DioError catch (e) {
      printWarning(e.response!.data['error']);
      loading.value = false;
    }
  }
}
