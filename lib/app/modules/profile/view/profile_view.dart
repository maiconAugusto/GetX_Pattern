import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/core/components/profile_card/profile_card.dart';
import 'package:get_x/app/core/components/simmer/simmer.dart';
import 'package:get_x/app/modules/profile/controllers/profile_controller.dart';
import 'package:get_x/app/routes/app_routes.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigoAccent,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_rounded)),
          actions: [
            Obx(() {
              return IconButton(
                  onPressed: () {
                    controller.favorite(controller.showUser.id.toString());
                  },
                  icon: controller.isFavorite.value
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red[300],
                        )
                      : const Icon(Icons.favorite_border));
            })
          ],
        ),
        body: Obx(() {
          return controller.loading.value == true
              ? const Simmer()
              : Column(
                  children: [
                    ProfileCard(
                      photo: controller.showUser.photo ?? '',
                      name: controller.showUser.name ?? '',
                      ocupation: controller.showUser.occupation ?? '',
                      onPress: () {},
                      rate: 5,
                      expandend: true,
                      isRate: true,
                      radius: 8.0,
                      height: 100.0,
                      width: 100.0,
                      description: controller.showUser.description ?? '',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Card(
                      elevation: 4,
                      child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      controller.showUser.phone ?? '',
                                      style: Get.textTheme.bodyText2,
                                    )
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      FlutterClipboard.copy(
                                              controller.showUser.phone ?? '')
                                          .then((value) => {
                                                controller.printWarning(
                                                    'Número copiado')
                                              });
                                    },
                                    icon: const Icon(Icons.copy_outlined))
                              ],
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(() {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Column(
                          children: [
                            ExpansionPanelList(
                              expansionCallback: (int index, bool isExpanded) {
                                controller.openAddress.value =
                                    !controller.openAddress.value;
                              },
                              elevation: 4,
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'Endereço',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blueGrey[800],
                                            fontWeight: FontWeight.w500),
                                      ),
                                    );
                                  },
                                  body: ListTile(
                                    title: Text(
                                      '${controller.showUser.city}, ${controller.showUser.state}, ${controller.showUser.houseNumber}, ${controller.showUser.street ?? ''}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blueGrey[800],
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  isExpanded: controller.openAddress.value,
                                  canTapOnHeader: false,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ExpansionPanelList(
                              expansionCallback: (int index, bool isExpanded) {
                                controller.openAvaliation.value =
                                    !controller.openAvaliation.value;
                              },
                              elevation: 4,
                              children: [
                                ExpansionPanel(
                                  headerBuilder: (context, isExpanded) {
                                    return ListTile(
                                      title: Text(
                                        'Ver avaliações',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blueGrey[800],
                                            fontWeight: FontWeight.w500),
                                      ),
                                    );
                                  },
                                  body: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blueGrey[800],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  isExpanded: controller.openAvaliation.value,
                                  canTapOnHeader: false,
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                );
        }),
        floatingActionButton: Obx(() {
          return controller.loading.value == true
              ? const SizedBox()
              : FloatingActionButton(
                  backgroundColor: Colors.indigoAccent,
                  child: const Icon(Icons.messenger_outline_rounded),
                  onPressed: () {
                    Get.toNamed(Routes.chat);
                  },
                );
        }));
  }
}
