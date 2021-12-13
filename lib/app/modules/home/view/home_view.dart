import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/core/components/profile_card/profile_card.dart';
import 'package:get_x/app/core/components/simmer/simmer.dart';

import 'package:get_x/app/modules/home/controllers/home_controller.dart';
import 'package:get_x/app/routes/app_routes.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return controller.loading.value == true
          ? const Simmer()
          : Container(
              padding: const EdgeInsets.only(bottom: 8, top: 8),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.refreshAllUsers();
                },
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.users.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProfileCard(
                          photo: controller.users[index].photo ?? '',
                          name: controller.users[index].name ?? '',
                          ocupation: controller.users[index].occupation ?? '',
                          onPress: () {
                            Get.toNamed(Routes.profile,
                                arguments: {'id': controller.users[index].id});
                          },
                          rate: 2,
                          isRate: true,
                          radius: 8.0,
                          height: 80.0,
                          width: 80.0,
                          expandend: false,
                          description: '');
                    }),
              ));
    }));
  }
}
