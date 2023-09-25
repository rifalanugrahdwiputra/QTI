import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_pages.dart';
import '../utils/local_storage.dart';

class AppAuthSignMiddleware extends GetMiddleware {
  final box = GetStorage();

  @override
  RouteSettings? redirect(String? route) {
    return box.read(LocalStorage.isSignIn) == null ||
            box.read(LocalStorage.isSignIn) == false
        ? const RouteSettings(name: Routes.signIn)
        : null;
  }
}
