import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/core/components/profile_card/profile_card.dart';
import 'package:get_x/app/routes/app_routes.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return ProfileCard(
              name: 'Maicon Augusto Carvalho de Freitas',
              ocupation: 'Desenvolvedor Jr.',
              onPress: () {
                Get.toNamed(Routes.profile, arguments: {'isFavorite': true});
              },
              rate: 2,
              isRate: true,
              radius: 8.0,
              expandend: false,
              height: 100.0,
              width: 100.0,
              description: '');
        },
      ),
    ));
  }
}
