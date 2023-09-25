import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/app_colors.dart';
import '../components/body_dashboard.dart';
import '../components/bottom_navbar_dashboard.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyDashboard(controller: controller),
      bottomNavigationBar: BottomNavBarDashboard(controller: controller),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 56.0,
        height: 56.0,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.buttonColorGradient1,
              AppColors.buttonColorGradient2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          shape: BoxShape.circle,
        ),
        child: RawMaterialButton(
          onPressed: () {
            Get.toNamed(Routes.addAsset);
          },
          elevation: 0,
          shape: const CircleBorder(),
          fillColor: Colors.transparent,
          padding: const EdgeInsets.all(11.0),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
