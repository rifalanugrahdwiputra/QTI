import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../controllers/dashboard_controller.dart';

class BottomNavBarDashboard extends StatelessWidget {
  const BottomNavBarDashboard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: AppColors.appBarColor,
        onTap: controller.changeTabIndex,
        currentIndex: controller.currentIndex.value,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle: const TextStyle(
          color: AppColors.primaryColor,
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: const TextStyle(
          color: AppColors.primaryColor,
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
        ),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home.svg",
              color: AppColors.disableColorNavbar,
              height: 30.0,
            ),
            label: "Home",
            activeIcon: SvgPicture.asset(
              "assets/icons/home.svg",
              color: AppColors.primaryColor,
              height: 30.0,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/assets.svg",
              color: AppColors.disableColorNavbar,
              height: 20.0,
            ),
            label: "Asset",
            activeIcon: SvgPicture.asset(
              "assets/icons/assets.svg",
              color: AppColors.primaryColor,
              height: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
