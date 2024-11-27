import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/widgets/app_texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          color: AppColors.blackColor,
          size: 24,
          text: title,
          weight: FontWeight.w500,
        ),
      ],
    );
  }
}
