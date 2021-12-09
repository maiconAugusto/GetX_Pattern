import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_x/app/data/model/address_model.dart';
import 'package:get_x/app/data/provider/address_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyDataController extends GetxController {
  final AddressProvier apiAddress = AddressProvier();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController ocupationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  double latitude = 0;
  double longitude = 0;

  final Rx<File>? _avatar = File('').obs;
  final ImagePicker _picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  final Rx<AddressModel> _address = AddressModel().obs;
  final Rx<bool> hasAddress = false.obs;
  final Rx<bool> passwordVisible = false.obs;

  var maskedCPF = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  var maskedPhone = MaskTextInputFormatter(
      mask: '(##) #####-#######', filter: {"#": RegExp(r'[0-9]')});

  var maskedCep = MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});

  File get profileImage => _avatar!.value;
  AddressModel get getAddressUser => _address.value;

  @override
  void onInit() {
    _getCurrentPosition();
    super.onInit();
  }

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  bool positionStreamStarted = false;

  Future<void> getAddress(String cep) async {
    if (cep.replaceAll('-', '').length >= 8) {
      final AddressModel response = await apiAddress.getAddress(cep);
      _address.value = response;
      hasAddress.value = true;
      cityController.text = response.localidade!;
      streetController.text = response.logradouro!;
    }
  }

  void lockPassword() {
    if (passwordVisible.value == false) {
      passwordVisible.value = true;
    } else {
      passwordVisible.value = false;
    }
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }

    final position = await _geolocatorPlatform.getCurrentPosition();
    latitude = position.latitude;
    longitude = position.longitude;
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        _getCurrentPosition();
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      latitude = 1;
      longitude = 1;
      return false;
    }

    return true;
  }

  Future<void> registerUser() async {
    if (profileImage.path == '') {
      var snack = SnackBar(
        content: const Text(
          'Foto é obrigatória!',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.redAccent[200],
      );
      ScaffoldMessenger.of(Get.context!).showSnackBar(snack);
    }
    if (formKey.currentState!.validate()) {}
  }

  Future<void> getPhoto() async {
    File? file;
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    file = image != null ? File(image.path) : null;
    _avatar!.value = file!;
  }
}
