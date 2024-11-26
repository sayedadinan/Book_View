import 'package:books_app/features/books/domain/repositeries/rating_repository.dart';

class AddRating {
  final RatingRepository repository;

  AddRating({required this.repository});

  Future<void> call(String bookId, int rating) async {
    return await repository.addRating(bookId, rating);
  }
}
