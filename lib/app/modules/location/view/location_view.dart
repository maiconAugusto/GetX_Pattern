import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/modules/location/controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Column(
            children: [],
          )
        ],
      ),
    );
  }
}
