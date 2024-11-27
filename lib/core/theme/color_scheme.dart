import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFFF56C04); // Vibrant Orange
  static const Color whiteColor = Colors.white; // Pure White
  static const Color greyColor = Color(0xFF5C5C5C); // Dark Grey
  static const Color blackColor = Colors.black; // Pure Black
  static const Color lightRoseColor = Color(0xFFFFE0E0); // Light Rose Pink
  static const Color lightGreyColor = Color.fromARGB(255, 220, 220, 220); // Soft Grey
  static const Color successColor = Colors.green; // Green for Success
  static const Gradient gradient = LinearGradient(
    colors: [
      Color(0xFFF59504), // Yellowish Orange
      Color(0xFFF56C04), // Orange
    ],
    begin: Alignment.topRight,
    end: Alignment.center,
  );

  static const List<Color> colorList = [
    Color(0xFFFFF7E8), // Light Peach
    Color(0xFFE3F8FF), // Soft Sky Blue
    Color(0xFFFFE3F0), // Pale Pink
    Color(0xFFD9F6E5), // Mint Green
    Color(0xFFE9EAF9), // Lavender Blue
    Color(0xFFFFFCE5), // Light Yellow
    Color(0xFFF9E7FF), // Lilac
    Color(0xFFFFF0E0), // Light Apricot
    Color(0xFFE0F7F5), // Soft Turquoise
    Color(0xFFF8F3FF), // Light Lavender
  ];
}
