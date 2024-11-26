part of 'rating_bloc.dart';
abstract class RatingState {}

class RatingInitial extends RatingState {}

class RatingLoading extends RatingState {}

class RatingSuccess extends RatingState {}

class RatingError extends RatingState {
  final String message;

  RatingError({required this.message});
}
