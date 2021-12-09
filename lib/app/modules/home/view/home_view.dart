import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/core/components/profile_card/profile_card.dart';

import 'package:get_x/app/modules/home/controllers/home_controller.dart';
import 'package:get_x/app/routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return ProfileCard(
                name: 'Maicon Augusto Carvalho de Freitas',
                ocupation: 'Desenvolvedor Jr.',
                onPress: () {
                  Get.toNamed(Routes.profile);
                },
                rate: 2,
                isRate: true,
                radius: 8.0,
                height: 100.0,
                width: 100.0,
                expandend: false,
                description: '');
          }),
    ));
  }
}
