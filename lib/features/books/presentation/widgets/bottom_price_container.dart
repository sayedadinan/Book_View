import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/widgets/app_customsizedbox.dart';
import 'package:books_app/core/widgets/app_texts.dart';
import 'package:books_app/features/books/domain/entities/book.dart';
import 'package:books_app/features/books/presentation/widgets/rating_sheet.dart';
import 'package:flutter/material.dart';

class BottomPriceContainer extends StatelessWidget {
  const BottomPriceContainer({
    super.key,
    required this.bookDetails,
  });

  final Book bookDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(58),
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          border:
              const Border(top: BorderSide(color: AppColors.lightGreyColor))),
      child: Padding(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(14),
            right: getProportionateScreenWidth(14)),
        child: Column(
          children: [
            const CustomSizedBoxHeight(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  color: AppColors.blackColor,
                  size: 16,
                  text: '₹ ${bookDetails.price}',
                  weight: FontWeight.w700,
                ),
                GestureDetector(
                  onTap: () {
                    // Trigger the color toggle event
                    // context.read<ColorSwitchBloc>().add(ToggleColorEvent());
                    showBottomSheetRating(context, bookDetails.id);
                  },
                  child: Container(
                    width: getProportionateScreenWidth(90),
                    height: getProportionateScreenHeight(30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: AppColors.primaryColor),
                    child: Center(
                      child: CustomText(
                        color: AppColors.whiteColor,
                        size: 13,
                        text: 'Add rating',
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const CustomSizedBoxHeight(10)
          ],
        ),
      ),
    );
  }
}
