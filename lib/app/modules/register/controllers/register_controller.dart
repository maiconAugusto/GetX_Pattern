import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_x/app/data/model/address_model.dart';
import 'package:get_x/app/data/model/user_model.dart';
import 'package:get_x/app/data/provider/address_provider.dart';
import 'package:get_x/app/data/provider/user_provider.dart';
import 'package:get_x/app/routes/app_routes.dart';
import 'package:get_x/app/utils/base_utils.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  final UserProvider _user = Get.find<UserProvider>();
  final AddressProvier apiAddress = AddressProvier();
  Rx<String> photoBaseb4 = ''.obs;
  BaseUtils utils = BaseUtils();

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
  TextEditingController dateBirthController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  double latitude = 0;
  double longitude = 0;
  RxBool loading = false.obs;

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

  var maskedBirthDate = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  File get profileImage => _avatar!.value;
  AddressModel get getAddressUser => _address.value;

  @override
  void onInit() {
    _getCurrentPosition();
    super.onInit();
  }

  Future<void> registerUser() async {
    try {
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
      if (formKey.currentState!.validate()) {
        loading.value = true;
        await _user.registerUser(UserModel(
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
            photo: photoBaseb4.value,
            password: passwordController.text,
            country: 'Brasil',
            state: countryController.text));
        loading.value = false;

        Get.offAndToNamed(Routes.sucessRegister);
      }
    } on DioError catch (e) {
      loading.value = false;
      utils.printWarning(
          'Algo deu errado, verefique seus dados e tente novamente');
    }
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
      countryController.text = response.uf!;
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

  Future<void> getPhoto() async {
    File? file;
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    File compressedFile = await FlutterNativeImage.compressImage(image!.path,
        quality: 60, percentage: 70);

    final bytes = File(compressedFile.path).readAsBytesSync();
    String base64Image = "data:image/png;base64," + base64Encode(bytes);

    photoBaseb4.value = base64Image;

    file = image != null ? File(image.path) : null;
    _avatar!.value = file!;
  }
}
