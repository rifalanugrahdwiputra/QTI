// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qti/app/data/models/assets_model.dart';
import 'package:qti/app/data/models/location_all_model.dart';
import 'package:qti/app/data/models/status_all_model.dart';
import '../../../data/providers/form_providers.dart';
import '../../../utils/app_colors.dart';

import 'package:http/http.dart' as http;

import '../../../utils/local_storage.dart';

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

  // void addAsset(BuildContext context) async {
  //   var isValid = key.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   key.currentState!.save();

  //   final Map<String, dynamic> dataRequest = {
  //     "name": nameAssetController.text,
  //     "status_id": statusController.text,
  //     "location_id": locationController.text
  //   };

  //   try {
  //     isLoading.toggle();
  //     final response = await http.post(
  //       Uri.parse('http://117.54.250.99:28089/asset'),
  //       body: dataRequest,
  //     );

  //     if (response.statusCode == 200) {
  //       final assetData = json.decode(response.body);
  //       AssetModel response = AssetModel.fromJson(assetData);

  //       if (response.id!.isNotEmpty) {
  //         dialogSubmit(context);
  //         nameAssetController.clear();
  //         statusController.clear();
  //         locationController.clear();
  //       } else {
  //         Get.snackbar("Error", "Please check your input value");
  //       }
  //     } else {
  //       Get.snackbar("Error", "Failed to submit data");
  //     }
  //   } catch (error) {
  //     Get.snackbar("Error", error.toString());
  //   } finally {
  //     isLoading.toggle();
  //   }

  //   // try {
  //   //   isLoading.toggle();
  //   //   AssetModel response =
  //   //       await formProviders.postAsset(dataRequest: dataRequest);
  //   //   if (response.id!.isNotEmpty) {
  //   //     dialogSubmit(context);
  //   //     nameAssetController.clear();
  //   //     statusController.clear();
  //   //     locationController.clear();
  //   //   } else {
  //   //     Get.snackbar("Error", "Please check your input value");
  //   //   }
  //   // } on DioError catch (error) {
  //   //   Get.snackbar("Error", error.message.toString());
  //   // } finally {
  //   //   isLoading.toggle();
  //   // }
  // }

  void addAsset(BuildContext context) async {
    var isValid = key.currentState!.validate();
    if (!isValid) {
      return;
    }
    key.currentState!.save();

    final Map<String, dynamic> dataRequest = {
      "name": nameAssetController.text,
      "status_id": statusController.text,
      "location_id": locationController.text,
    };

    AssetModel response; // Declare response as an AssetModel

    try {
      final String authToken = 'Bearer ${box.read(LocalStorage.tokenJWT)}';
      isLoading.toggle();
      final Uri initialUri = Uri.parse('http://117.54.250.99:28089/asset');
      final Map<String, String> headers = {
        'Authorization': authToken,
        'Content-Type': 'application/json',
      };

      Uri currentUri = initialUri;

      while (true) {
        final http.Response httpResponse = await http.post(
          currentUri,
          headers: headers,
          body: json.encode(dataRequest),
        );

        if (httpResponse.statusCode == 307) {
          final redirectUrl = httpResponse.headers['location'];
          if (redirectUrl != null) {
            currentUri = Uri.parse(redirectUrl);
            continue;
          } else {
            Get.snackbar("Error", "Redirect URL not found");
            break;
          }
        } else if (httpResponse.statusCode == 201) {
          final assetData = json.decode(httpResponse.body);
          response = AssetModel.fromJson(assetData);

          if (response.id!.isNotEmpty) {
            dialogSubmit(context);
            nameAssetController.clear();
            statusController.clear();
            locationController.clear();
          } else {
            Get.snackbar("Error", "Please check your input value");
          }
          break;
        } else {
          Get.snackbar("Error", "Failed to submit data");
          break;
        }
      }
    } catch (error) {
      Get.snackbar("Error", error.toString());
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
      Get.back();
    });
  }
}
