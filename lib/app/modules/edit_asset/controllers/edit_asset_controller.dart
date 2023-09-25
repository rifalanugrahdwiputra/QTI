// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qti/app/data/models/assets_edit_model.dart';
import 'package:qti/app/data/providers/form_providers.dart';
import 'package:http/http.dart' as http;

import '../../../data/providers/asset_providers.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/local_storage.dart';

class EditAssetController extends GetxController {
  GetStorage box = GetStorage();
  RxBool isLoading = false.obs;
  TextEditingController nameAssetController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController nameStatusController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController nameLocationController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  var assetData = [].obs;
  AssetProviders assetProviders = AssetProviders();
  FormProviders formProviders = FormProviders();

  @override
  void onClose() {
    super.dispose();
  }

  @override
  void onInit() async {
    super.onInit();
  }

  getAsset({required String id}) async {
    try {
      isLoading.toggle();
      AssetEditModel response = await assetProviders.getAssetEdit(id: id);
      if (response.id!.isNotEmpty) {
        nameAssetController.text = response.name!;
        nameStatusController.text = response.status!.name!;
        nameLocationController.text = response.location!.name!;
      } else {
        assetData.value = [];
      }
    } on DioError catch (dioError) {
      print(dioError);
    } finally {
      isLoading.toggle();
    }
  }

  void updateAsset(BuildContext context, String? id) async {
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
      AssetEditModel response =
          await formProviders.updateEdit(dataRequest: dataRequest, id: id);
      if (response.id!.isNotEmpty) {
        dialogUpdate(context);
      } else {
        Get.snackbar("Error", "Please check your value form");
      }
    } on DioError catch (error) {
      Get.snackbar("Error", error.message.toString());
    } finally {
      isLoading.toggle();
    }
  }

  Future<void> deleteAsset(BuildContext context, String? id) async {
    final headers = {
      'Authorization': 'Bearer ${box.read(LocalStorage.tokenJWT)}',
      'Content-Type': 'application/json',
    };
    final response = await http.delete(
      Uri.parse(
        "http://117.54.250.99:28089/asset/$id",
      ),
      headers: headers,
    );
    if (response.statusCode == 204) {
      Navigator.pop(context);
      dialogSuccessDelete(context);
    } else {
      print(response.statusCode);
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

  void dialogUpdate(BuildContext context) {
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
                  "Data has been update.",
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
      Get.back();
    });
  }

  void dialogSuccessDelete(BuildContext context) {
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
                  "Data has been Deleted",
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
      Get.back();
      Get.back();
    });
  }

  void dialogDeleted(BuildContext context, String? id) {
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
          title: const Text(
            "Confirmation",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
            textAlign: TextAlign.center,
          ),
          titlePadding: const EdgeInsets.symmetric(vertical: 15.0),
          content: const Text(
            "Your action will cause this data permanently deleted. ",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
            textAlign: TextAlign.center,
          ),
          contentPadding: const EdgeInsets.only(
            right: 30.0,
            left: 30.0,
            bottom: 17.0,
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 83,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    border: Border.all(
                      color: AppColors.redColor,
                      width: 1.4,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.redColor,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  width: 83,
                  height: 36,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.buttonColorGradient1,
                        AppColors.buttonColorGradient2,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      deleteAsset(
                        context,
                        id,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      "Delete",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
          actionsPadding: const EdgeInsets.only(
            bottom: 15.0,
          ),
        );
      },
    );
  }
}
