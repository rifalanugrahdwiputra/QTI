import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Form(
          key: controller.key,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/banner.png",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 380.0,
              ),
              Positioned(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16.0,
                        right: 26.0,
                        left: 26.0,
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/images/logo-only.svg",
                            height: 33.0,
                            width: 51.0,
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const Text(
                            "Welcome back!",
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors.whiteColor,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 68.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "You’ve been missed, Please sign in your account",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.whiteColor,
                                      fontFamily: 'Quicksand',
                                    ),
                                    overflow: TextOverflow.fade,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 230.0),
                          TextFormField(
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: controller.validateEmail,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyColor,
                              fontFamily: 'Quicksand',
                            ),
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyColor,
                                fontFamily: 'Quicksand',
                              ),
                              prefixIcon: Image.asset(
                                "assets/icons/email.png",
                                height: 10.0,
                                width: 16.67,
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
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                            ),
                          ),
                          const SizedBox(height: 18.0),
                          TextFormField(
                            controller: controller.passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: controller.obscureTextInput.value,
                            validator: controller.validatePassword,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyColor,
                              fontFamily: 'Quicksand',
                            ),
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyColor,
                                fontFamily: 'Quicksand',
                              ),
                              prefixIcon: Image.asset(
                                "assets/icons/lock.png",
                                height: 10.0,
                                width: 16.67,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.obscureTextInput.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.iconEyeColor,
                                ),
                                onPressed: () => controller.secureText(),
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
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  width: 1.1,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                            ),
                          ),
                          const SizedBox(height: 60.0),
                          Container(
                            width: double.infinity,
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
                              onPressed: () => controller.login(),
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
                                "Login",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white, // Warna teks
                                  fontFamily: 'Quicksand',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
