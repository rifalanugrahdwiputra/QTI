import 'package:flutter/material.dart';

class AppColors {
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color appBarColor = Color(0xFFFFFFFF);
  static const Color backgroundColor = Color(0xFFF9F9F9);
  static const Color tealColor = Color(0xFF00B6AC);
  static const Color orangeColor = Color(0xFFFF7C45);
  static const Color redColor = Color(0xFFFF6169);
  static const Color primaryColor500 = Color(0xFF88C1F4);
  static const Color primaryColor300 = Color(0xFFECF3FA);
  static const Color buttonColorGradient1 = Color(0xFF7DC1FF);
  static const Color buttonColorGradient2 = Color(0xFF278CEA);
  static const Color greyColor = Color(0xFF818896);
  static const Color primaryColor = Color(0xFF2B8FEB);
  static const Color iconEyeColor = Color(0xFF67ACEB);
  static const Color disableColorNavbar = Color(0xFF06122B);
  static const Color blackColor = Color(0xFF06122B);
  static const Color shadowCardColor = Color(0xFF677FB9);

  static const Map<int, Color> colorMap = {
    50: Color(0xFF88C1F4),
    100: Color(0xFF88C1F4),
    200: Color(0xFF88C1F4),
    300: Color(0xFF88C1F4),
    400: Color(0xFF88C1F4),
    500: Color(colorPrimaryMaterial),
    600: Color(0xFF88C1F4),
    700: Color(0xFF88C1F4),
    800: Color(0xFF88C1F4),
    900: Color(0xFF88C1F4),
  };

  static const int colorPrimaryMaterial = 0xFF88C1F4;
  static const MaterialColor primaryMaterial =
      MaterialColor(colorPrimaryMaterial, colorMap);
}
