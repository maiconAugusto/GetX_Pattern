import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/core/components/profile_card/profile_card.dart';
import 'package:get_x/app/core/components/simmer/simmer.dart';
import 'package:get_x/app/modules/favorites/controllers/favorites_controller.dart';
import 'package:get_x/app/routes/app_routes.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return controller.loading.value == true
          ? const Simmer()
          : Container(
              padding: const EdgeInsets.only(bottom: 8, top: 8),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.refreshFavorites();
                },
                child: ListView.builder(
                  itemCount: controller.favorites.length,
                  itemBuilder: (context, index) {
                    return ProfileCard(
                        photo: controller.favorites[index].photo ?? '',
                        name: controller.favorites[index].name ?? '',
                        ocupation: controller.favorites[index].occupation ?? '',
                        onPress: () {
                          Get.toNamed(Routes.profile, arguments: {
                            'isFavorite': true,
                            'id': controller.favorites[index].favoriteId,
                            '_id': controller.favorites[index].id,
                          });
                        },
                        rate: 2,
                        isRate: true,
                        radius: 8.0,
                        expandend: false,
                        height: 80.0,
                        width: 80.0,
                        description: '');
                  },
                ),
              ));
    }));
  }
}
