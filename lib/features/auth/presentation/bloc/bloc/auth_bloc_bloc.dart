import 'package:bloc/bloc.dart';
import 'package:books_app/features/auth/domain/usecase/register_user.dart';
part "auth_bloc_event.dart";
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUser registerUser;

  AuthBloc({required this.registerUser}) : super(AuthInitial()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final auth = await registerUser(event.username, event.password);
        emit(AuthSuccess(message: auth.message));
      } catch (e) {
        emit(AuthFailure(error: e.toString()));
      }
    });
  }
}
