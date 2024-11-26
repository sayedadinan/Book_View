part of 'rating_bloc.dart';

abstract class RatingEvent {}

class AddRatingEvent extends RatingEvent {
  final String bookId;
  final int rating;

  AddRatingEvent({required this.bookId, required this.rating});
}
