import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/core/components/profile_card/profile_card.dart';
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfileCard(
              name: 'Maicon Augusto Carvalho',
              ocupation: "Backend Jr.",
              onPress: () {},
              rate: 5,
              expandend: true,
              description:
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.',
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
                              '67 89898-9090',
                              style: Get.textTheme.bodyText2,
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              FlutterClipboard.copy('9009').then((value) =>
                                  {controller.printWarning('Número copiado')});
                            },
                            icon: const Icon(Icons.copy_outlined))
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  children: [
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
                                style: Get.textTheme.bodyText1,
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
                                  style: Get.textTheme.bodyText2,
                                ),
                              );
                            },
                          ),
                          isExpanded: controller.openAvaliation.value,
                          canTapOnHeader: false,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                                style: Get.textTheme.bodyText1,
                              ),
                            );
                          },
                          body: ListTile(
                            title: Text(
                              'Ponta Porã, Rua Guia Lopez, N 152',
                              style: Get.textTheme.bodyText2,
                            ),
                          ),
                          isExpanded: controller.openAddress.value,
                          canTapOnHeader: false,
                        )
                      ],
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigoAccent,
        child: const Icon(Icons.messenger_outline_rounded),
        onPressed: () {
          Get.toNamed(Routes.chat);
        },
      ),
    );
  }
}
