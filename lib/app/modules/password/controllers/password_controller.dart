import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey key = GlobalKey<FormState>();
}
