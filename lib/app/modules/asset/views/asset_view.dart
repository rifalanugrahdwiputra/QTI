import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qti/app/modules/asset/controllers/asset_controller.dart';
import 'package:qti/app/modules/edit_asset/views/edit_asset_view.dart';
import 'package:qti/app/modules/home/controllers/home_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/local_storage.dart';

class AssetView extends GetView<AssetController> {
  const AssetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AssetViewPage(),
    );
  }
}

class AssetViewPage extends StatefulWidget {
  const AssetViewPage({super.key});

  @override
  State<AssetViewPage> createState() => _AssetViewPageState();
}

class _AssetViewPageState extends State<AssetViewPage> {
  AssetController controller = AssetController();
  HomeController homeController = HomeController();
  int page = 1;

  @override
  void initState() {
    super.initState();
    controller.getAsset();
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
                    homeController.dialogLogout(context);
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
        child: Obx(
          () {
            return RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(milliseconds: 800));
                controller.getAsset();
              },
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  const Text(
                    "List Asset",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                      fontFamily: 'Quicksand',
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    onTap: () {
                      setState(() {
                        // location.toggle();
                      });
                    },
                    // controller: controller.nameAssetController,
                    keyboardType: TextInputType.emailAddress,
                    // validator: controller.validateAssetName,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyColor,
                      fontFamily: 'Quicksand',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search asset',
                      hintStyle: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyColor,
                        fontFamily: 'Quicksand',
                      ),
                      filled: true,
                      fillColor: AppColors.primaryColor300,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.1,
                          color: AppColors.primaryColor500,
                        ),
                      ),
                      suffixIcon: const Icon(
                        Icons.search,
                        size: 27.0,
                        color: AppColors.greyColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.1,
                          color: AppColors.primaryColor500,
                        ),
                        borderRadius: BorderRadius.circular(5.0), // Radius 5px
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0), // Radius 5px
                        borderSide: const BorderSide(
                          width: 1.1,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              5.0,
                            ),
                          ),
                          color: AppColors.whiteColor,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.assetData.length,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 10.0,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 9.0),
                                child: Card(
                                  elevation: 3.0,
                                  shadowColor: AppColors.shadowCardColor
                                      .withOpacity(0.03),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Asset Name",
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.greyColor,
                                                fontFamily: 'Quicksand',
                                              ),
                                            ),
                                            const SizedBox(height: 2.0),
                                            Text(
                                              controller.assetData[index].name,
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.blackColor,
                                                fontFamily: 'Quicksand',
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 40.0,
                                          height: 40.0,
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
                                              Get.to(
                                                EditAssetView(
                                                  id: controller
                                                      .assetData[index].id,
                                                ),
                                              );
                                            },
                                            elevation: 0,
                                            shape: const CircleBorder(),
                                            fillColor: Colors.transparent,
                                            padding: const EdgeInsets.all(8.0),
                                            child: const Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                              size: 25.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
