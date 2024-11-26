import 'dart:developer';

import 'package:books_app/features/books/domain/entities/book.dart';
import 'package:books_app/features/books/domain/usecase/get_books.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetBooks getBooks;
  List<Book> allBooks = []; // Store the full list of books for searching

  BookBloc({required this.getBooks}) : super(BookInitial()) {
    on<FetchBooksEvent>((event, emit) async {
      // Emit BookLoading if it's the first page
      if (event.page == 1) {
        emit(BookLoading());
      }

      try {
        // Fetch new books
        final books = await getBooks(event.page, event.limit);

        // Update the full list for searching
        if (state is BookLoaded) {
          final currentBooks = (state as BookLoaded).books;
          allBooks = [...currentBooks, ...books];
          emit(BookLoaded(books: allBooks));
        } else {
          allBooks = books;
          emit(BookLoaded(books: books));
        }

        log('Fetched books count: ${books.length}');
      } catch (e) {
        emit(BookError(e.toString()));
      }
    });

    on<SearchBooksEvent>((event, emit) {
      if (event.query.isEmpty) {
        // If the search query is empty, show all books
        emit(BookLoaded(books: allBooks));
      } else {
        // Filter books by title based on the search query
        final filteredBooks = allBooks
            .where((book) =>
                book.title.toLowerCase().contains(event.query.toLowerCase()))
            .toList();

        emit(BookLoaded(books: filteredBooks));
      }
    });
  }
}
