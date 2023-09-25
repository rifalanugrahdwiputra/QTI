import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:qti/app/data/models/location_model.dart';
import 'package:qti/app/data/models/me_model.dart';
import 'package:qti/app/data/models/status_model.dart';
import 'package:qti/app/data/providers/auth_providers.dart';
import 'package:qti/app/data/providers/form_providers.dart';
import 'package:qti/app/utils/local_storage.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/app_colors.dart';

class HomeController extends GetxController {
  GetStorage box = GetStorage();
  RxBool isLoading = false.obs;
  String date = DateFormat('EEEE, dd/MM/yyyy').format(DateTime.now());
  var assetData = [].obs;
  var statusData = [].obs;
  var locationData = [].obs;
  AuthProviders authProviders = AuthProviders();
  FormProviders formProviders = FormProviders();

  @override
  void onInit() async {
    super.onInit();
    getMe();
    getStatus();
    getLocation();
  }

  getStatus({int? page}) async {
    try {
      isLoading.toggle();
      StatusModel response = await formProviders.getStatus();
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

  getLocation({int? page}) async {
    try {
      isLoading.toggle();
      LocationModel response = await formProviders.getLocation();
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

  getMe() async {
    try {
      isLoading.toggle();
      MeModel response = await authProviders.getMe();
      if (response.id!.isNotEmpty) {
        box.write(LocalStorage.idUser, response.id);
        box.write(LocalStorage.username, response.username);
        box.write(LocalStorage.email, response.email);
      } else {
        assetData.value = [];
      }
    } on DioError catch (dioError) {
      print(dioError);
    } finally {
      isLoading.toggle();
    }
  }

  postLogout() async {
    try {
      isLoading.toggle();
      MeModel response = await authProviders.postLogout();
      if (response.id!.isNotEmpty) {
        box.remove(LocalStorage.email);
        box.remove(LocalStorage.username);
        box.remove(LocalStorage.idUser);
        box.remove(LocalStorage.isSignIn);
        box.remove(LocalStorage.tokenJWT);
        Get.offAllNamed(Routes.signIn);
      } else {
        assetData.value = [];
      }
    } on DioError catch (dioError) {
      print(dioError);
    } finally {
      isLoading.toggle();
    }
  }

  void dialogLogout(BuildContext context) {
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
            "Logout",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
            textAlign: TextAlign.center,
          ),
          titlePadding: const EdgeInsets.symmetric(vertical: 15.0),
          content: const Text(
            "When you want to use this app, you have to relogin, are you sure?",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
            textAlign: TextAlign.center,
          ),
          contentPadding: const EdgeInsets.only(
            right: 45.0,
            left: 45.0,
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
                      postLogout();
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
                      "Logout",
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
