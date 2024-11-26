part of 'book_bloc.dart';

abstract class BookState {}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<Book> books;

  BookLoaded({required this.books});
}

class BookError extends BookState {
  final String message;

  BookError(this.message);
}

class BookDetailsLoaded extends BookState {
  final Map<String, dynamic> book; // or your `Book` model class

  BookDetailsLoaded({required this.book});
}
