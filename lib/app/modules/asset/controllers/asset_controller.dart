import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:qti/app/data/models/assets_all_model.dart';

import '../../../data/providers/asset_providers.dart';

class AssetController extends GetxController {
  GetStorage box = GetStorage();
  RxBool isLoading = false.obs;
  String date = DateFormat('EEEE, dd/MM/yyyy').format(DateTime.now());
  var assetData = [].obs;
  AssetProviders assetProviders = AssetProviders();

  @override
  void onInit() async {
    super.onInit();
    getAsset();
  }

  @override
  void onClose() {
    super.dispose();
  }

  getAsset({int? page}) async {
    try {
      isLoading.toggle();
      AssetAllModel response =
          await assetProviders.getAsset(page: page ?? 1, pageSize: 100);
      if (response.results!.isNotEmpty) {
        assetData.value = response.results!;
      } else {
        assetData.value = [];
      }
    } on DioError catch (dioError) {
      print(dioError);
    } finally {
      isLoading.toggle();
    }
  }
}
