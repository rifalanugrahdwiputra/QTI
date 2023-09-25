import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashboardController extends GetxController {
  GetStorage box = GetStorage();
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    initConfig();
    super.onInit();
  }

  @override
  void onClose() {}

  changeTabIndex(int index) {
    currentIndex.value = index;
  }

  void initConfig() {}
}
