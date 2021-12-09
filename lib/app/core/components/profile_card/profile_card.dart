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
    required this.isRate,
    required this.radius,
    required this.height,
    required this.width,
  }) : super(key: key);
  final String name;
  final String ocupation;
  final Function() onPress;
  final int rate;
  final bool expandend;
  final String description;
  final bool isRate;
  final double radius;
  final double height;
  final double width;

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
                            borderRadius: BorderRadius.circular(radius),
                            child: ProgressiveImage(
                              thumbnail: const NetworkImage(Images.profile),
                              image: const NetworkImage(
                                Images.profile,
                              ),
                              height: height,
                              fit: BoxFit.cover,
                              width: width,
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
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blueGrey[800],
                                  fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              ocupation,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.blueGrey[600],
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Visibility(
                              visible: isRate,
                              child: Rate(
                                rate: rate,
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                    Visibility(
                        visible: expandend,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 14,
                            ),
                            Text(description,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blueGrey[600],
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                  ],
                ))));
  }
}
