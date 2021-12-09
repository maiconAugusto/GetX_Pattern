import 'package:get/get.dart';
import 'package:get_x/app/data/provider/address_provider.dart';
import 'package:get_x/app/modules/my_data/controllers/my_data_controller.dart';

class MyDataBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyDataController>(() => MyDataController());
    Get.lazyPut<AddressProvier>(() => AddressProvier());
  }
}
