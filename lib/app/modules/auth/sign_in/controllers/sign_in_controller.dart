import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qti/app/data/providers/auth_providers.dart';

import '../../../../data/models/auth_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/local_storage.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  GetStorage box = GetStorage();
  AuthProviders authProviders = AuthProviders();

  RxBool obscureTextInput = true.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    validateEmail(emailController.text);
    validatePassword(passwordController.text);
    super.onInit();
  }

  void login() async {
    var isValid = key.currentState!.validate();
    if (!isValid) {
      return;
    }
    key.currentState!.save();

    final Map<String, dynamic> dataRequest = {
      "email": emailController.text,
      "password": passwordController.text,
    };

    try {
      isLoading.toggle();
      AuthModel response =
          await authProviders.postAuth(dataRequest: dataRequest);
      if (response.is_active != false) {
        box.write(LocalStorage.isSignIn, true);
        box.write(LocalStorage.tokenJWT, response.token);
        box.write(LocalStorage.idUser, response.id);
        box.write(LocalStorage.username, response.username);
        box.write(LocalStorage.email, response.email);
        Get.offAllNamed(Routes.dashboard);
      } else {
        Get.snackbar("Error", "Please check your username or password again");
      }
    } on DioError catch (error) {
      Get.snackbar("Error", error.message.toString());
    } finally {
      isLoading.toggle();
    }
  }

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return "This form is required";
    } else {
      if (!GetUtils.isEmail(value)) {
        return "Invalid email!";
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return "This form is required";
    } else {
      return null;
    }
  }

  void secureText() {
    obscureTextInput.toggle();
  }
}
