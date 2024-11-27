import 'package:books_app/core/theme/color_scheme.dart';
import 'package:books_app/core/utils/extentions.dart';
import 'package:books_app/core/widgets/app_customsizedbox.dart';
import 'package:books_app/core/widgets/app_title_widget.dart';
import 'package:books_app/features/books/presentation/bloc/bloc/book_bloc.dart';
import 'package:books_app/features/books/presentation/widgets/book_grid_view.dart';
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
            const TitleWidget(title: 'App name'),
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

                  return BookGridView(
                      scrollController: _scrollController, books: books);
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
          ],
        ),
      ),
    );
  }
}
