import 'package:get/get.dart';

import '../controllers/edit_asset_controller.dart';

class EditAssetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditAssetController>(
      () => EditAssetController(),
    );
  }
}
