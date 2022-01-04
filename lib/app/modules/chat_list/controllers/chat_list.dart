import 'package:get/get.dart';
import 'package:get_x/app/data/model/resume_list_model.dart';
import 'package:get_x/app/data/provider/user_provider.dart';
import 'package:get_x/app/utils/base_utils.dart';

class ChatListController extends GetxController {
  final UserProvider _user = Get.find<UserProvider>();
  BaseUtils utils = BaseUtils();
  RxBool loading = false.obs;
  RxString iduser = ''.obs;
  final RxList<ResumeListModel> _resume = RxList<ResumeListModel>();

  bool get isLoading => loading.value;
  List get resume => _resume.toList();

  @override
  void onInit() {
    resumeListMessage();
    super.onInit();
  }

  Future<void> resumeListMessage() async {
    try {
      _resume.clear();

      String? id = await utils.getId();

      iduser.value = id!;

      loading.value = true;
      final response = await _user.getListResume(id);
      _resume.addAll(response);
      loading.value = false;
    } catch (e) {
      loading.value = false;
      utils.printWarning('Erro ao ler as mensagens');
    }
  }
}
