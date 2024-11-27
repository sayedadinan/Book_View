import 'package:books_app/core/utils/extentions.dart';
import 'package:flutter/material.dart';

class CustomSizedBoxHeight extends StatelessWidget {
  final double height;

  const CustomSizedBoxHeight(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(height),
    );
  }
}
//----------->>>>>>>>>>>>>>>>>>>>>> This is the widgets using for empty spaces in height and width<<<<<<<<<<<<<<<<<<<----------------

class CustomSizedBoxWidth extends StatelessWidget {
  final double width;

  const CustomSizedBoxWidth(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(width),
    );
  }
}
