import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/widgets/app_customsizedbox.dart';
import 'package:books_app/core/widgets/app_texts.dart';
import 'package:books_app/features/books/presentation/bloc/bloc/book_bloc.dart';
import 'package:books_app/features/books/presentation/pages/book_details_screen.dart';
import 'package:books_app/features/books/presentation/widgets/grid_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  final ScrollController _scrollController = ScrollController();
  int currentPage = 1;
  bool _isFetching = true;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<BookBloc>().add(FetchBooksEvent(currentPage, 10));
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent &&
        !_isFetching) {
      // Ensure only one fetch at a time
      _isFetching = true;
      currentPage++;
      context.read<BookBloc>().add(FetchBooksEvent(currentPage, 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(14),
          right: getProportionateScreenWidth(14),
        ),
        child: Column(
          children: [
            const CustomSizedBoxHeight(34),
            const Row(
              children: [
                CustomText(
                  color: AppColors.blackColor,
                  size: 24,
                  text: 'App name',
                  weight: FontWeight.w500,
                ),
              ],
            ),
            const CustomSizedBoxHeight(12),
            CupertinoSearchTextField(
              onChanged: (value) {
                context.read<BookBloc>().add(SearchBooksEvent(value));
              },
              placeholder: "Search books...",
            ),
            BlocBuilder<BookBloc, BookState>(
              builder: (context, state) {
                if (state is BookLoading && currentPage == 1) {
                  return const Expanded(child: GridShimmer());
                } else if (state is BookLoaded) {
                  final books = state.books;
                  _isFetching = false; // Reset fetching flag

                  return Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => BookDetailsScreen(
                                  bookDetails: book,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 173, 171, 171)
                                          .withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 9,
                                  offset: const Offset(0.5, 0.1),
                                ),
                              ],
                              color: Colors.white,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                } else if (state is BookError) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                }
                return const Expanded(
                  child: Center(
                    child: Text("Unexpected error occurred."),
                  ),
                );
              },
            ),
            // if (state is BookLoading && currentPage > 1)
            //   const Padding(
            //     padding: EdgeInsets.all(8.0),
            //     child: CircularProgressIndicator(),
            //   ),
          ],
        ),
      ),
    );
  }
}
