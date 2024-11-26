import 'package:books_app/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  final FontWeight? weight;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines; // Add maxLines parameter

  const CustomText({
    super.key,
    required this.text,
    this.textOverflow,
    required this.size,
    required this.color,
    this.textAlign,
    this.weight,
    this.maxLines, // Initialize maxLines
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines, // Set maxLines
      style: TextStyle(
        fontWeight: weight,
        overflow: textOverflow,
        color: color,
        fontSize: getProportionateScreenWidth(size),
      ),
    );
  }
}
