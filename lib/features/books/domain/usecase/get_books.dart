import 'package:books_app/features/books/domain/repositeries/book_repository.dart';

import '../entities/book.dart';

class GetBooks {
  final BookRepository repository;

  GetBooks({required this.repository});

  Future<List<Book>> call(int page, int limit) {
    return repository.fetchBooks(page, limit);
  }
}
