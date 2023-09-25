import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart' show Obx;
import 'package:qti/app/modules/asset/views/asset_view.dart';
import 'package:qti/app/modules/home/views/home_view.dart';
import '../controllers/dashboard_controller.dart';

class BodyDashboard extends StatelessWidget {
  const BodyDashboard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: controller.currentIndex.value,
        children: const [
          HomeView(),
          AssetView(),
        ],
      ),
    );
  }
}
