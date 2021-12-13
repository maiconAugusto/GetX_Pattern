import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/app/data/model/user_model.dart';
import 'package:get_x/app/data/provider/user_provider.dart';
import 'package:get_x/app/utils/base_utils.dart';

class ProfileController extends GetxController {
  final UserProvider _user = Get.find<UserProvider>();
  RxBool openAvaliation = false.obs;
  RxBool openAddress = false.obs;
  RxBool isFavorite = false.obs;
  RxBool loading = false.obs;
  BaseUtils utils = BaseUtils();
  final Rx<UserModel> _profile = UserModel().obs;

  UserModel get showUser => _profile.value;

  @override
  void onInit() {
    requestUser();
    hasFavorite();
    super.onInit();
  }

  Future<void> requestUser() async {
    try {
      loading.value = true;
      final response = await _user.showUser(Get.arguments['id']);
      _profile.value = response;
      loading.value = false;
    } catch (e) {
      loading.value = false;
    }
  }

  Future<void> favorite(String favoriteId) async {
    try {
      String? userId = await utils.getId();
      final response = await _user.favorite(userId!, favoriteId);
      isFavorite.value = false;
      utils.printWarningSucess(response);
    } catch (e) {
      utils.printWarning('Erro ao favoritar');
    }
  }

  Future<void> unFavorite(String id) async {
    try {
      await _user.removeFavorite(id);
      isFavorite.value = false;
      utils.printWarningSucess('Desfavoritado');
    } catch (e) {
      utils.printWarning('Erro ao desfavoritar');
    }
  }

  void hasFavorite() {
    if (Get.arguments?['isFavorite'] != null) {
      isFavorite.value = Get.arguments['isFavorite'];
    }
  }

  void printWarning(String info) {
    final snackBar = SnackBar(
      content: Text(
        info,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.green[400],
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}
