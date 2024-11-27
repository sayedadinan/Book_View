import 'package:books_app/core/route.dart';
import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/widgets/app_customsizedbox.dart';
import 'package:books_app/core/widgets/app_texts.dart';
import 'package:books_app/features/books/domain/entities/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookGridView extends StatelessWidget {
  const BookGridView({
    super.key,
    required ScrollController scrollController,
    required this.books,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final List<Book> books;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        controller: _scrollController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          childAspectRatio: 0.56, // Adjust height/width ratio
          crossAxisSpacing: 3,
          mainAxisSpacing: 3,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () {
              context.push('/book-details',
                  extra: BookDetailsArguments(
                      bookDetails: book,
                      additionalData: AppColors.colorList[index]));
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 173, 171, 171)
                        .withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 9,
                    offset: const Offset(0.5, 0.1),
                  ),
                ],
                color: AppColors.whiteColor,
              ),
              width: getProportionateScreenWidth(179),
              height: getProportionateScreenHeight(274),
              child: Column(
                children: [
                  const CustomSizedBoxHeight(10),
                  Container(
                    width: getProportionateScreenWidth(106),
                    height: getProportionateScreenHeight(160),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: NetworkImage(book.coverPictureURL),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const CustomSizedBoxHeight(14),
                  Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          color: AppColors.blackColor,
                          size: 13,
                          text: book.title,
                          weight: FontWeight.w500,
                        ),
                        CustomText(
                          color: AppColors.blackColor,
                          size: 11,
                          text: book.title,
                          weight: FontWeight.w400,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            CustomText(
                              color: AppColors.blackColor,
                              size: 11,
                              text: '${book.starCount}',
                              weight: FontWeight.w400,
                            ),
                          ],
                        ),
                        CustomText(
                          color: AppColors.blackColor,
                          size: 13,
                          text: '₹ ${book.price}',
                          weight: FontWeight.w600,
                        ),
                        const CustomSizedBoxHeight(8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
