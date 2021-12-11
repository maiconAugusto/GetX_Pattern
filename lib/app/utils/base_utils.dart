import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void printWarningSucess(String info) {
    final snackBar = SnackBar(
      content: Text(
        info,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green[400],
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  Future<String?> getId() async {
    SharedPreferences prefsGet = await SharedPreferences.getInstance();
    String? id = prefsGet.getString('id');
    return id;
  }

  Future<void> setId(String id) async {
    SharedPreferences prefsSet = await SharedPreferences.getInstance();
    prefsSet.setString('id', id.toString());
  }

  Future<void> removeId() async {
    SharedPreferences prefsSet = await SharedPreferences.getInstance();
    prefsSet.remove('id');
  }
}
