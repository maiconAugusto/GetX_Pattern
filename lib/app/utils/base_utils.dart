import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseUtils {
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
}
