import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFF56C04);
  static const Color whiteColor = Colors.white;
  static const Color greyColor = Color(0xFF5C5C5C);
  static const Color blackColor = Colors.black;
  static const Color lightRoseColor = Color(0xFFFFE0E0);
  static const Color lightGreyColor = Color.fromARGB(255, 220, 220, 220);
  static const Color successColor = Colors.green;
  static const Gradient gradient = LinearGradient(
    colors: [
      Color(0xFFF59504), // Yellowish Orange
      Color(0xFFF56C04), // Orange
    ],
    begin: Alignment.topRight,
    end: Alignment.center,
  );
}
