import '../entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> fetchBooks(int page, int limit);
  
}
