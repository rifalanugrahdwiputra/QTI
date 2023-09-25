import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../add_asset/controllers/add_asset_controller.dart';
import '../controllers/edit_asset_controller.dart';

class EditAssetView extends StatefulWidget {
  const EditAssetView({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<EditAssetView> createState() => _EditAssetViewState();
}

class _EditAssetViewState extends State<EditAssetView> {
  EditAssetController controller = EditAssetController();
  AddAssetController addController = AddAssetController();
  RxBool status = false.obs;
  RxBool location = false.obs;
  String? statusAssets;
  String? locationAssets;

  @override
  void initState() {
    super.initState();
    controller.getAsset(id: widget.id);
    addController.getStatus();
    addController.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.key,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          shadowColor: AppColors.shadowCardColor.withOpacity(0.03),
          elevation: 3,
          backgroundColor: AppColors.appBarColor,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              size: 30.0,
              color: AppColors.blackColor,
            ),
          ),
          title: const Text(
            "Edit Asset",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
              fontFamily: 'Quicksand',
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 18.0, left: 22.0, right: 177.0),
                child: Text(
                  "Edit this form below",
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Asset Name",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      controller: controller.nameAssetController,
                      keyboardType: TextInputType.emailAddress,
                      validator: controller.validateAssetName,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyColor,
                        fontFamily: 'Quicksand',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Input name',
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
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.1,
                            color: AppColors.primaryColor500,
                          ),
                          borderRadius:
                              BorderRadius.circular(5.0), // Radius 5px
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(5.0), // Radius 5px
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
                    const SizedBox(height: 18.0),
                    const Text(
                      "Status",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      onTap: () {
                        setState(() {
                          status.toggle();
                        });
                      },
                      validator: controller.validateStatus,
                      controller: controller.nameStatusController,
                      readOnly: true,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyColor,
                        fontFamily: 'Quicksand',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Select status',
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
                          Icons.keyboard_arrow_down_sharp,
                          size: 30.0,
                          color: AppColors.greyColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.1,
                            color: AppColors.primaryColor500,
                          ),
                          borderRadius:
                              BorderRadius.circular(5.0), // Radius 5px
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(5.0), // Radius 5px
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
                    status.isTrue
                        ? Column(
                            children: [
                              const SizedBox(height: 8.0),
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
                                      color: AppColors.primaryColor300,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            addController.statusData.length,
                                        padding: const EdgeInsets.all(0.0),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                statusAssets = addController
                                                    .statusData[index].name;
                                                controller.nameStatusController
                                                        .text =
                                                    addController
                                                        .statusData[index].name;
                                                controller
                                                        .statusController.text =
                                                    addController
                                                        .statusData[index].id;
                                                print(controller
                                                    .statusController.text);
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 16.0,
                                                vertical: 12.0,
                                              ),
                                              child: Text(
                                                addController
                                                    .statusData[index].name,
                                                style: const TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.blackColor,
                                                  fontFamily: 'Quicksand',
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
                          )
                        : Container(),
                    const SizedBox(height: 18.0),
                    const Text(
                      "Location",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      onTap: () {
                        setState(() {
                          location.toggle();
                        });
                      },
                      validator: controller.validateLocation,
                      controller: controller.nameLocationController,
                      readOnly: true,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.greyColor,
                        fontFamily: 'Quicksand',
                      ),
                      decoration: InputDecoration(
                        hintText: 'Select location',
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
                          Icons.keyboard_arrow_down_sharp,
                          size: 30.0,
                          color: AppColors.greyColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.1,
                            color: AppColors.primaryColor500,
                          ),
                          borderRadius:
                              BorderRadius.circular(5.0), // Radius 5px
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(5.0), // Radius 5px
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
                    location.isTrue
                        ? Column(
                            children: [
                              const SizedBox(height: 8.0),
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
                                      color: AppColors.primaryColor300,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            addController.locationData.length,
                                        padding: const EdgeInsets.all(0.0),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              setState(() {
                                                locationAssets = addController
                                                    .locationData[index].name;
                                                controller
                                                        .nameLocationController
                                                        .text =
                                                    addController
                                                        .locationData[index]
                                                        .name;
                                                controller.locationController
                                                        .text =
                                                    addController
                                                        .locationData[index].id;
                                                print(controller
                                                    .locationController.text);
                                              });
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 16.0,
                                                vertical: 12.0,
                                              ),
                                              child: Text(
                                                addController
                                                    .locationData[index].name,
                                                style: const TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.blackColor,
                                                  fontFamily: 'Quicksand',
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
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 33.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 45,
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
                    onPressed: () =>
                        controller.dialogDeleted(context, widget.id),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.redColor,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Container(
                  height: 45,
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
                    onPressed: () => controller.updateAsset(context, widget.id),
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
                      "Save Update",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
