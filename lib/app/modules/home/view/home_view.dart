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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: ListView.builder(
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
                expandend: false,
                description: '');
          }),
    );
  }
}
