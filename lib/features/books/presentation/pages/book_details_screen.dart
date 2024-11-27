import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/widgets/app_customsizedbox.dart';
import 'package:books_app/core/widgets/app_texts.dart';
import 'package:books_app/features/books/domain/entities/book.dart';
import 'package:books_app/features/books/presentation/bloc/bloc/rating_bloc.dart';
import 'package:books_app/features/books/presentation/widgets/rating_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

final ratingController = TextEditingController();
String formatPublishedDate(DateTime? publishedDate) {
  if (publishedDate == null) {
    return 'Unknown'; // Handle null value if necessary
  }
  return DateFormat('MMMM d, yyyy').format(publishedDate);
}

class BookDetailsScreen extends StatelessWidget {
  final Book bookDetails;
  final Color colorthing;
  const BookDetailsScreen(
      {super.key, required this.bookDetails, required this.colorthing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: BlocListener<RatingBloc, RatingState>(
          listener: (context, state) {
            if (state is RatingSuccess) {
              showTopSnackBar(
                Overlay.of(context),
                const CustomSnackBar.success(
                  message: "Successfully rated the book",
                ),
              );
              context.pop(); // close the current screen
            } else if (state is RatingError) {
              showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                  message: state.message,
                ),
              );
            }
          },
          child: Column(
            children: [
              const CustomSizedBoxHeight(42),
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(19)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.blackColor,
                        ))
                  ],
                ),
              ),
              const CustomSizedBoxHeight(13),
              Container(
                width: double.infinity,
                height: getProportionateScreenHeight(300),
                color: colorthing,
                child: Center(
                  child: SizedBox(
                    height: getProportionateScreenHeight(260),
                    width: getProportionateScreenWidth(171),
                    child: Image.network(bookDetails.coverPictureURL),
                  ),
                ),
              ),
              const CustomSizedBoxHeight(13),
              Padding(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(19),
                    right: getProportionateScreenWidth(19)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: getProportionateScreenWidth(270),
                          child: CustomText(
                            textOverflow: TextOverflow.ellipsis,
                            color: AppColors.blackColor,
                            size: 18,
                            text: bookDetails.title,
                            weight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: getProportionateScreenWidth(48),
                          height: getProportionateScreenHeight(22),
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: AppColors.lightGreyColor, width: 1)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber[500],
                              ),
                              CustomText(
                                color: AppColors.blackColor,
                                size: 13,
                                text: bookDetails.starCount.toString(),
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(270),
                      child: CustomText(
                        textOverflow: TextOverflow.ellipsis,
                        color: AppColors.blackColor,
                        size: 13,
                        text: bookDetails.title,
                        weight: FontWeight.w400,
                      ),
                    ),
                    const CustomSizedBoxHeight(8),
                    CustomText(
                      color: AppColors.greyColor,
                      size: 11,
                      text:
                          'Published date: ${formatPublishedDate(bookDetails.publishedDate)}',
                      weight: FontWeight.w400,
                    ),
                    const CustomSizedBoxHeight(8),
                    CustomText(
                      color: AppColors.blackColor,
                      size: 12,
                      text: bookDetails.description,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: getProportionateScreenHeight(58),
        decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            border: Border(top: BorderSide(color: AppColors.lightGreyColor))),
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
                      showBottomSheetRating(context, bookDetails.id);
                    },
                    child: Container(
                      width: getProportionateScreenWidth(90),
                      height: getProportionateScreenHeight(30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: AppColors.primaryColor),
                      child: const Center(
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
      ),
    );
  }
}
