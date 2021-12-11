import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_x/app/data/model/user_model.dart';
import 'package:get_x/app/data/provider/home_provider.dart';
import 'package:get_x/app/utils/base_utils.dart';

class HomeController extends GetxController {
  final HomeProvider _users = Get.find<HomeProvider>();
  final RxBool value = false.obs;
  final RxBool loading = false.obs;

  BaseUtils utils = BaseUtils();

  final RxList<UserModel> _usersPlatform = RxList<UserModel>();
  List<UserModel> get users => _usersPlatform.toList();

  @override
  void onInit() {
    requestAllUsers();
    super.onInit();
  }

  Future<void> requestAllUsers() async {
    try {
      loading.value = true;
      final response = await _users.allUsersPlatform();
      _usersPlatform.addAll(response);
      loading.value = false;
    } on DioError catch (e) {
      utils.printWarning(e.response!.data['error']);
      loading.value = false;
    }
  }
}
