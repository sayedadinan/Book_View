import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/widgets/app_customsizedbox.dart';
import 'package:books_app/core/widgets/app_texts.dart';
import 'package:books_app/features/books/presentation/bloc/bloc/rating_bloc.dart';
import 'package:books_app/features/books/presentation/pages/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void showBottomSheetRating(BuildContext context, String bookId) {
  //------------------------------------------------this is bottom sheet for rating book----------------------------------------------
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
    ),
    backgroundColor: AppColors.whiteColor,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 5,
                margin: const EdgeInsets.only(bottom: 16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const CustomSizedBoxHeight(12),
            const CustomText(
              color: AppColors.blackColor,
              size: 18,
              text: 'Add rating',
              weight: FontWeight.w600,
            ),
            const CustomSizedBoxHeight(12),
            Divider(
              color: AppColors.lightGreyColor,
            ),
            const CustomSizedBoxHeight(16),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                ratingController.text = rating.toString();
              },
            ),
            const CustomSizedBoxHeight(16),
            Divider(
              color: AppColors.lightGreyColor,
            ),
            const CustomSizedBoxHeight(14),
            GestureDetector(
              onTap: () {
                final double rating = double.parse(ratingController.text);

                // Convert the rating to an integer if needed

                context.read<RatingBloc>().add(
                      AddRatingEvent(
                          bookId: bookId,
                          rating: rating.round()), // Use `round()`
                    );
              },
              child: Container(
                width: double.infinity,
                height: getProportionateScreenHeight(40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppColors.primaryColor,
                ),
                child: const Center(
                  child: CustomText(
                    color: AppColors.whiteColor,
                    size: 12,
                    text: 'Submit',
                    weight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const CustomSizedBoxHeight(20),
          ],
        ),
      );
    },
  );
}
