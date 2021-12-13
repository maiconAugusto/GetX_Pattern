import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_x/initial_binding.dart';
import 'package:get_x/app/routes/app_pages.dart';
import 'package:get_x/app/routes/app_routes.dart';
import 'package:get_x/app/theme/app_theme.dart';

void main() async {
  await dotenv.load(fileName: "assets/.env");

  runApp(GetMaterialApp(
    title: 'Services',
    debugShowCheckedModeBanner: false,
    theme: themeApp,
    getPages: AppPages.routes,
    initialBinding: InitialBinding(),
    initialRoute: Routes.login,
  ));
}
