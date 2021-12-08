import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_x/app/core/components/rate/rate.dart';
import 'package:get_x/app/core/images.dart';
import 'package:progressive_image/progressive_image.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.name,
    required this.ocupation,
    required this.onPress,
    required this.rate,
    required this.expandend,
    required this.description,
  }) : super(key: key);
  final String name;
  final String ocupation;
  final Function() onPress;
  final int rate;
  final bool expandend;
  final String description;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onPress();
        },
        child: Card(
            elevation: 4,
            shadowColor: Colors.grey,
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: ProgressiveImage(
                              thumbnail: const NetworkImage(Images.profile),
                              image: const NetworkImage(
                                Images.profile,
                              ),
                              height: 100,
                              fit: BoxFit.cover,
                              width: 100,
                              placeholder: null,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              name,
                              style: Get.theme.textTheme.bodyText1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              ocupation,
                              style: Get.theme.textTheme.bodyText2,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Rate(
                              rate: rate,
                            )
                          ],
                        ))
                      ],
                    ),
                    Visibility(
                        visible: expandend,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 12,
                            ),
                            Text(description, style: Get.textTheme.bodyText2),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                  ],
                ))));
  }
}
