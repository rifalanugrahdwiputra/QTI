// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qti/app/data/models/assets_model.dart';
import 'package:qti/app/data/models/location_all_model.dart';
import 'package:qti/app/data/models/status_all_model.dart';
import '../../../data/providers/form_providers.dart';
import '../../../utils/app_colors.dart';

class AddAssetController extends GetxController {
  GetStorage box = GetStorage();
  RxBool isLoading = false.obs;
  TextEditingController nameAssetController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController nameStatusController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController nameLocationController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  var statusData = [].obs;
  var locationData = [].obs;
  FormProviders formProviders = FormProviders();

  @override
  void onClose() {
    super.dispose();
  }

  @override
  void onInit() async {
    validateAssetName(nameAssetController.text);
    validateStatus(statusController.text);
    validateLocation(locationController.text);
    super.onInit();
  }

  getStatus() async {
    try {
      isLoading.toggle();
      StatusAllModel response = await formProviders.getStatusAll();
      if (response.results!.isNotEmpty) {
        statusData.value = response.results!;
      } else {
        statusData.value = [];
      }
    } on DioError catch (dioError) {
      print(dioError);
    } finally {
      isLoading.toggle();
    }
  }

  getLocation() async {
    try {
      isLoading.toggle();
      LocationAllModel response = await formProviders.getLocationAll();
      if (response.results!.isNotEmpty) {
        locationData.value = response.results!;
      } else {
        locationData.value = [];
      }
    } on DioError catch (dioError) {
      print(dioError);
    } finally {
      isLoading.toggle();
    }
  }

  void addAsset(BuildContext context) async {
    var isValid = key.currentState!.validate();
    if (!isValid) {
      return;
    }
    key.currentState!.save();

    final Map<String, dynamic> dataRequest = {
      "name": nameAssetController.text,
      "status_id": statusController.text,
      "location_id": locationController.text
    };

    try {
      isLoading.toggle();
      AssetModel response =
          await formProviders.postAsset(dataRequest: dataRequest);
      if (response.id!.isNotEmpty) {
        dialogSubmit(context);
        nameAssetController.clear();
        statusController.clear();
        locationController.clear();
      } else {
        Get.snackbar("Error", "Please check your input value");
      }
    } on DioError catch (error) {
      Get.snackbar("Error", error.message.toString());
    } finally {
      isLoading.toggle();
    }
  }

  String? validateAssetName(String? value) {
    if (value!.isEmpty) {
      return "This form is required";
    } else {
      return null;
    }
  }

  String? validateStatus(String? value) {
    if (value!.isEmpty) {
      return "This form is required";
    } else {
      return null;
    }
  }

  String? validateLocation(String? value) {
    if (value!.isEmpty) {
      return "This form is required";
    } else {
      return null;
    }
  }

  void dialogSubmit(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          title: Image.asset(
            "assets/images/success.png",
            height: 65.0,
            width: 108.0,
          ),
          titlePadding: const EdgeInsets.symmetric(vertical: 16.0),
          content: const Text(
            "Success!",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
            textAlign: TextAlign.center,
          ),
          contentPadding: const EdgeInsets.only(
            right: 45.0,
            left: 45.0,
            bottom: 16.0,
          ),
          actions: const <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Data has been submitted.",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
          actionsPadding: const EdgeInsets.only(
            bottom: 22.0,
          ),
        );
      },
    );
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }
}
