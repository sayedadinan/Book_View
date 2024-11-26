import 'package:books_app/features/books/data/datasources/rating_remote_data_source.dart';
import 'package:books_app/features/books/domain/repositeries/rating_repository.dart';

class RatingRepositoryImpl implements RatingRepository {
  final RatingRemoteDataSource remoteDataSource;

  RatingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addRating(String bookId, int rating) async {
    await remoteDataSource.addRating(bookId, rating);
  }
}
