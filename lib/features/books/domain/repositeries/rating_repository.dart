abstract class RatingRepository {
  Future<void> addRating(String bookId, int rating);
}
