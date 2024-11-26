part of 'book_bloc.dart';

abstract class BookEvent {}

class FetchBooksEvent extends BookEvent {
  final int page;
  final int limit;

  FetchBooksEvent(this.page, this.limit);
}

class SearchBooksEvent extends BookEvent {
  final String query;

  SearchBooksEvent(this.query);
}

class FetchBookByIdEvent extends BookEvent {
  final String bookId;

  FetchBookByIdEvent(this.bookId);
}
