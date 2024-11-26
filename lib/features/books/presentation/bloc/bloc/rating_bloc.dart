import 'package:bloc/bloc.dart';
import 'package:books_app/features/books/domain/usecase/add_rating.dart';
part 'rating_event.dart';
part 'rating_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final AddRating addRating;

  RatingBloc({required this.addRating}) : super(RatingInitial()) {
    on<AddRatingEvent>((event, emit) async {
      emit(RatingLoading());
      try {
        await addRating(event.bookId, event.rating);
        emit(RatingSuccess());
        // Navigator.of(context).pop();
      } catch (e) {
        emit(RatingError(message: e.toString()));
      }
    });
  }
}
