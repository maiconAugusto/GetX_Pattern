import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarBase extends StatelessWidget {
  const AppBarBase({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back, color: Colors.red)),
            Text(title),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications, color: Colors.red))
          ],
        ),
      ),
    );
  }
}
