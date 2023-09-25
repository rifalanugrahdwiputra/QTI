import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qti/app/data/models/location_model.dart';
import 'package:qti/app/modules/home/controllers/home_controller.dart';
import 'package:qti/app/utils/local_storage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../data/models/status_model.dart';
import '../../../utils/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getMe();
    controller.getStatus();
    controller.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        shadowColor: AppColors.shadowCardColor.withOpacity(0.03),
        elevation: 3,
        backgroundColor: AppColors.appBarColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "assets/images/logo-horizontal.png",
              height: 40.0,
              width: 107.0,
            ),
            const Text(
              "TEST QTI",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
                fontFamily: 'Quicksand',
              ),
            ),
          ],
        ),
        centerTitle: false,
        bottom: AppBar(
          backgroundColor: AppColors.appBarColor,
          shadowColor: AppColors.shadowCardColor.withOpacity(0.03),
          elevation: 3,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/avatar.png",
                    height: 45.0,
                    width: 45.0,
                  ),
                  const SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.box.read(LocalStorage.username),
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        controller.box.read(LocalStorage.email),
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 80,
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
                    controller.dialogLogout(context);
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
                      color: Colors.white,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                ),
              ),
            ],
          ),
          centerTitle: false,
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          return RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 800));
              controller.getMe();
              controller.getStatus();
              controller.getLocation();
            },
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Text(
                  "Status",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                    fontFamily: 'Quicksand',
                  ),
                ),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: controller.statusData.map((data) {
                    return Expanded(
                      child: Card(
                        color: AppColors.whiteColor,
                        elevation: 1.0,
                        shadowColor:
                            AppColors.shadowCardColor.withOpacity(0.03),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Asset",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.greyColor,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                              Text(
                                data.status.name,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.greyColor,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                              const SizedBox(height: 26.0),
                              Text(
                                "${data.count}",
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackColor,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: AppColors.whiteColor,
                        elevation: 1.0,
                        shadowColor:
                            AppColors.shadowCardColor.withOpacity(0.03),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Chart",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackColor,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                height: 300,
                                child: SfCartesianChart(
                                  series: <ChartSeries>[
                                    BarSeries<Results, String>(
                                      dataSource:
                                          controller.statusData.cast<Results>(),
                                      xValueMapper: (Results results, _) =>
                                          results.status!.name ?? '',
                                      yValueMapper: (Results results, _) =>
                                          results.count ?? 0,
                                      color: Colors.blue,
                                      width: 0.3,
                                    ),
                                  ],
                                  isTransposed: true,
                                  primaryXAxis: CategoryAxis(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                const Text(
                  "Location",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                    fontFamily: 'Quicksand',
                  ),
                ),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: controller.locationData.map((data) {
                    return Expanded(
                      child: Card(
                        color: AppColors.whiteColor,
                        elevation: 1.0,
                        shadowColor:
                            AppColors.shadowCardColor.withOpacity(0.03),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.location.name,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.greyColor,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                              const SizedBox(height: 26.0),
                              Text(
                                "${data.count}",
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackColor,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 12.0),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        color: AppColors.whiteColor,
                        elevation: 1.0,
                        shadowColor:
                            AppColors.shadowCardColor.withOpacity(0.03),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            6.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Chart",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.blackColor,
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                height: 300,
                                child: SfCartesianChart(
                                  series: <ChartSeries>[
                                    BarSeries<ResultsLocation, String>(
                                      dataSource: controller.locationData
                                          .cast<ResultsLocation>(),
                                      xValueMapper:
                                          (ResultsLocation results, _) =>
                                              results.location!.name ?? '',
                                      yValueMapper:
                                          (ResultsLocation results, _) =>
                                              results.count ?? 0,
                                      color: Colors.blue,
                                      width: 0.3,
                                    ),
                                  ],
                                  isTransposed: true,
                                  primaryXAxis: CategoryAxis(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
