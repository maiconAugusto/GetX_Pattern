import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_x/app/data/model/address_model.dart';
import 'package:get_x/app/data/model/user_model.dart';
import 'package:get_x/app/data/provider/address_provider.dart';
import 'package:get_x/app/data/provider/user_provider.dart';
import 'package:get_x/app/utils/base_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyDataController extends GetxController {
  final AddressProvier apiAddress = AddressProvier();
  final UserProvider _user = Get.find<UserProvider>();

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
  TextEditingController dateBirthController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  double latitude = 0;
  double longitude = 0;

  Rx<Uint8List> photoBaseb4 = Uint8List(0).obs;
  String photoB64 = '';
  final Rx<File>? _avatar = File('').obs;
  final ImagePicker _picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  final Rx<AddressModel> _address = AddressModel().obs;
  final Rx<bool> passwordVisible = false.obs;
  RxBool loading = false.obs;

  BaseUtils utils = BaseUtils();

  var maskedCPF = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  var maskedPhone = MaskTextInputFormatter(
      mask: '(##) #####-#######', filter: {"#": RegExp(r'[0-9]')});

  var maskedCep = MaskTextInputFormatter(
      mask: '#####-###', filter: {"#": RegExp(r'[0-9]')});

  var maskedBirthDate = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  File get profileImage => _avatar!.value;
  AddressModel get getAddressUser => _address.value;

  @override
  void onInit() {
    _myData();
    _getCurrentPosition();
    super.onInit();
  }

  Future<void> _myData() async {
    try {
      String? id = await utils.getId();
      loading.value = true;
      final response = await _user.showUser(id!);

      nameController.text = response.name ?? 'Não informado';
      dateBirthController.text = response.birthDate ?? 'Não informado';
      emailController.text = response.email ?? 'Não informado';
      phoneController.text = response.phone ?? 'Não informado';
      cpfController.text = response.cpf ?? 'Não informado';
      cepController.text = response.cep ?? 'Não informado';
      ocupationController.text = response.occupation ?? 'Não informado';
      descriptionController.text = response.description ?? 'Não informado';
      houseNumberController.text = response.houseNumber ?? 'Não informado';
      streetController.text = response.street ?? 'Não informado';
      countryController.text = response.country ?? 'Não informado';
      cityController.text = response.city ?? 'Não informado';
      descriptionController.text = response.description ?? 'Não informado';

      if (response.photo!.isEmpty == false) {
        photoBaseb4.value =
            const Base64Decoder().convert(response.photo!.split('base64,')[1]);
      }
      photoB64 = response.photo ?? '';
      loading.value = false;
    } catch (e) {
      loading.value = false;
      utils.printWarning('Erro ao buscar seus dados');
    }
  }

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  bool positionStreamStarted = false;

  Future<void> getAddress(String cep) async {
    if (cep.replaceAll('-', '').length >= 8) {
      final AddressModel response = await apiAddress.getAddress(cep);
      _address.value = response;
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
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    File compressedFile = await FlutterNativeImage.compressImage(image!.path,
        quality: 50, percentage: 50);

    final bytes = File(compressedFile.path).readAsBytesSync();
    String base64Image = "data:image/png;base64," + base64Encode(bytes);

    photoBaseb4.value =
        const Base64Decoder().convert(base64Image.split('base64,')[1]);
    photoB64 = base64Image;
  }

  Future<void> updateData() async {
    try {
      String? id = await utils.getId();
      loading.value = true;
      await _user.updateUser(
          id!,
          UserModel(
              name: nameController.text,
              active: true,
              birthDate: dateBirthController.text,
              cep: cepController.text,
              city: cityController.text,
              street: streetController.text,
              cpf: cpfController.text,
              description: descriptionController.text,
              occupation: ocupationController.text,
              email: emailController.text,
              houseNumber: houseNumberController.text,
              id: '',
              phone: phoneController.text,
              photo: photoB64,
              country: 'Brasil',
              state: countryController.text));
      utils.printWarningSucess('Dados atualizados com sucesso');
      loading.value = false;
    } catch (e) {
      loading.value = false;
      utils.printWarning('Erro ao salvar os dados');
    }
  }
}
