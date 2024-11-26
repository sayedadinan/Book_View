import 'package:bloc/bloc.dart';
import 'package:books_app/features/authours/domain/entities/author.dart';
import 'package:books_app/features/authours/domain/usecase/get_authors.dart';
part 'author_event.dart';
part 'author_state.dart';

class AuthorBloc extends Bloc<AuthorEvent, AuthorState> {
  final GetAuthors getAuthors;

  AuthorBloc({required this.getAuthors}) : super(AuthorInitial()) {
    on<FetchAuthorsEvent>((event, emit) async {
      emit(AuthorLoading());
      try {
        final authors = await getAuthors();
        emit(AuthorLoaded(authors: authors));
      } catch (e) {
        emit(AuthorError(error: e.toString()));
      }
    });
  }
}
