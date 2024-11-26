import 'package:books_app/features/books/data/datasources/book_remote_data_source.dart';
import 'package:books_app/features/books/domain/repositeries/book_repository.dart';

import '../../domain/entities/book.dart';
import '../models/book_model.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDataSource remoteDataSource;

  BookRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Book>> fetchBooks(int page, int limit) async {
    final data = await remoteDataSource.fetchBooks(page, limit);
    return data.map((json) => BookModel.fromJson(json)).toList();
  }
}
